const API_BASE = 'http://localhost:3001/api';

class ApiService {
  async getPizzas() {
    try {
      const response = await fetch(`${API_BASE}/pizzas`);
      const data = await response.json();
      return data.success ? data.data : [];
    } catch (error) {
      console.error('Erro ao buscar pizzas:', error);
      return [];
    }
  }

  async createOrder(orderData) {
    try {
      const response = await fetch(`${API_BASE}/orders`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(orderData)
      });
      return await response.json();
    } catch (error) {
      console.error('Erro ao criar pedido:', error);
      return { success: false, message: 'Erro de conexão' };
    }
  }

  async getOrders() {
    try {
      const response = await fetch(`${API_BASE}/orders`);
      const data = await response.json();
      return data.success ? data.data : [];
    } catch (error) {
      console.error('Erro ao buscar pedidos:', error);
      return [];
    }
  }
}

module.exports = new ApiService();