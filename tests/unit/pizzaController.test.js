const pizzaController = require('../../src/backend/controllers/pizzaController');

describe('Pizza Controller', () => {
  test('should return all pizzas', () => {
    const req = {};
    const res = {
      json: jest.fn()
    };

    pizzaController.getAllPizzas(req, res);

    expect(res.json).toHaveBeenCalledWith({
      success: true,
      data: expect.any(Array),
      count: expect.any(Number)
    });
  });

  test('should return pizza by id', () => {
    const req = { params: { id: '1' } };
    const res = {
      json: jest.fn(),
      status: jest.fn().mockReturnThis()
    };

    pizzaController.getPizzaById(req, res);

    expect(res.json).toHaveBeenCalledWith({
      success: true,
      data: expect.any(Object)
    });
  });
});