const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const { logger, errorHandler } = require('./middleware/logger');
const pizzaRoutes = require('./routes/pizzaRoutes');
const config = require('./config/database');

const app = express();
const PORT = config.port;

// Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(logger);

// Routes
app.use('/api/pizzas', pizzaRoutes);

// Health check
app.get('/health', (req, res) => {
  res.json({
    status: 'OK',
    timestamp: new Date().toISOString(),
    service: 'PizzaFlow Backend API',
    environment: process.env.NODE_ENV || 'development',
    version: '1.0.0'
  });
});

// Error handling
app.use(errorHandler);

// 404 handler
app.use('*', (req, res) => {
  res.status(404).json({
    success: false,
    message: 'Endpoint não encontrado'
  });
});

app.listen(PORT, () => {
  console.log(`🍕 PizzaFlow API running on port ${PORT}`);
  console.log(`🏠 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`📊 Health: http://localhost:${PORT}/health`);
  console.log(`🛒 Pizzas: http://localhost:${PORT}/api/pizzas`);
});

module.exports = app;