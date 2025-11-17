const config = {
  development: {
    port: process.env.PORT || 3001,
    database: {
      url: process.env.DB_URL || 'mongodb://localhost:27017/pizzaflow_dev'
    },
    security: {
      jwtSecret: process.env.JWT_SECRET || 'pizzaflow-secret-key'
    }
  },
  production: {
    port: process.env.PORT || 3001,
    database: {
      url: process.env.DB_URL
    },
    security: {
      jwtSecret: process.env.JWT_SECRET
    }
  }
};

module.exports = config[process.env.NODE_ENV || 'development'];