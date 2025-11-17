#!/bin/bash

set -e

echo "🧪 Starting test suite..."

run_unit_tests() {
    echo "🔬 Running unit tests..."
    
    # Backend unit tests
    cd src/backend
    npm test -- --coverage
    cd ../..
    
    # Frontend unit tests
    cd src/frontend
    npm test -- --coverage
    cd ../..
    
    echo "✅ Unit tests completed"
}

run_integration_tests() {
    echo "🔗 Running integration tests..."
    
    # Start test environment
    docker-compose -f docker-compose.test.yml up -d
    
    # Wait for services to be ready
    sleep 30
    
    # Run integration tests
    cd tests/integration
    npm test
    cd ../..
    
    # Cleanup
    docker-compose -f docker-compose.test.yml down
    
    echo "✅ Integration tests completed"
}

run_e2e_tests() {
    echo "🌐 Running E2E tests..."
    
    # Start application
    docker-compose up -d
    
    # Wait for app to be ready
    sleep 45
    
    # Run E2E tests
    cd tests/e2e
    npm test
    cd ../..
    
    # Cleanup
    docker-compose down
    
    echo "✅ E2E tests completed"
}

run_security_scan() {
    echo "🔒 Running security scan..."
    
    # Scan for vulnerabilities
    npm audit --audit-level moderate
    
    # Docker image security scan
    docker scan pizzaflow-backend:latest
    
    echo "✅ Security scan completed"
}

generate_reports() {
    echo "📊 Generating test reports..."
    
    # Combine coverage reports
    npx lcov-result-merger 'coverage/*/lcov.info' 'coverage/combined.lcov'
    
    # Generate HTML report
    npx nyc report --reporter=html
    
    echo "📁 Reports generated in coverage/ directory"
}

main() {
    echo "🚀 Starting complete test pipeline..."
    
    run_unit_tests
    run_integration_tests
    run_e2e_tests
    run_security_scan
    generate_reports
    
    echo "🎉 All tests passed successfully!"
}

main "$@"