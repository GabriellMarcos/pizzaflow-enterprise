const request = require('supertest');
const app = require('../../src/backend/server');

describe('API Integration Tests', () => {
  describe('GET /health', () => {
    it('should return API health status', async () => {
      const response = await request(app).get('/health');
      
      expect(response.status).toBe(200);
      expect(response.body).toHaveProperty('status', 'OK');
      expect(response.body).toHaveProperty('service', 'PizzaFlow Backend API');
    });
  });

  describe('GET /api/pizzas', () => {
    it('should return all pizzas', async () => {
      const response = await request(app).get('/api/pizzas');
      
      expect(response.status).toBe(200);
      expect(response.body.success).toBe(true);
      expect(response.body.data).toBeInstanceOf(Array);
      expect(response.body.data.length).toBeGreaterThan(0);
    });
  });

  describe('POST /api/orders', () => {
    it('should create a new order', async () => {
      const orderData = {
        customerName: 'Maria Santos',
        items: '2x Margherita',
        total: 51.80
      };

      const response = await request(app)
        .post('/api/orders')
        .send(orderData);
      
      expect(response.status).toBe(201);
      expect(response.body.success).toBe(true);
      expect(response.body.data).toHaveProperty('id');
      expect(response.body.data.customerName).toBe('Maria Santos');
    });

    it('should validate order data', async () => {
      const invalidOrder = {
        customerName: '' // Missing required fields
      };

      const response = await request(app)
        .post('/api/orders')
        .send(invalidOrder);
      
      expect(response.status).toBe(400);
      expect(response.body.success).toBe(false);
    });
  });
});