#!/bin/bash

set -e

echo "🚀 Starting PizzaFlow deployment..."
echo "Environment: $ENVIRONMENT"
echo "Version: $VERSION"

# Validate environment
if [ -z "$ENVIRONMENT" ]; then
    echo "❌ ENVIRONMENT variable is required"
    exit 1
fi

# Deployment functions
deploy_backend() {
    echo "📦 Deploying backend..."
    
    # Build Docker image
    docker build -t pizzaflow-backend:$VERSION -f infrastructure/docker/backend/Dockerfile .
    
    # Push to ECR
    aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL
    docker tag pizzaflow-backend:$VERSION $ECR_URL:$VERSION
    docker push $ECR_URL:$VERSION
    
    # Update ECS service
    aws ecs update-service \
        --cluster pizzaflow-cluster-$ENVIRONMENT \
        --service pizzaflow-backend-$ENVIRONMENT \
        --force-new-deployment
    
    echo "✅ Backend deployment initiated"
}

deploy_frontend() {
    echo "🎨 Deploying frontend..."
    
    # Build frontend
    cd src/frontend
    npm install
    npm run build
    
    # Sync to S3
    aws s3 sync dist/ s3://pizzaflow-static-$ENVIRONMENT/ \
        --delete \
        --cache-control "max-age=31536000"
    
    # Invalidate CloudFront cache
    aws cloudfront create-invalidation \
        --distribution-id $CLOUDFRONT_DISTRIBUTION_ID \
        --paths "/*"
    
    cd ../..
    echo "✅ Frontend deployment completed"
}

run_migrations() {
    echo "🗃️ Running database migrations..."
    
    # Get RDS connection details from SSM
    DB_HOST=$(aws ssm get-parameter --name "/pizzaflow/$ENVIRONMENT/db/host" --query "Parameter.Value" --output text)
    
    # Run migrations (example - would need your migration tool)
    docker run --rm \
        -e DB_HOST=$DB_HOST \
        -e DB_PASSWORD=$DB_PASSWORD \
        pizzaflow-backend:$VERSION \
        npm run migrate
    
    echo "✅ Database migrations completed"
}

health_check() {
    echo "🏥 Performing health check..."
    
    API_URL="https://api.pizzaflow-$ENVIRONMENT.example.com"
    
    # Wait for service to be healthy
    for i in {1..30}; do
        if curl -f -s "$API_URL/health" > /dev/null; then
            echo "✅ Health check passed"
            return 0
        fi
        echo "⏳ Waiting for service to be healthy... ($i/30)"
        sleep 10
    done
    
    echo "❌ Health check failed"
    exit 1
}

# Main deployment flow
main() {
    echo "📋 Starting deployment pipeline..."
    
    deploy_backend
    run_migrations
    deploy_frontend
    health_check
    
    echo "🎉 Deployment completed successfully!"
    echo "🌐 Backend URL: https://api.pizzaflow-$ENVIRONMENT.example.com"
    echo "🎨 Frontend URL: https://pizzaflow-$ENVIRONMENT.example.com"
}

main "$@"