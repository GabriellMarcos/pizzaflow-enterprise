class Dashboard {
  constructor() {
    this.pizzas = [];
    this.orders = [];
  }

  async initialize() {
    await this.loadPizzas();
    await this.loadOrders();
    this.render();
    this.setupEventListeners();
  }

  async loadPizzas() {
    try {
      const response = await fetch('/api/pizzas');
      const data = await response.json();
      this.pizzas = data.data || [];
    } catch (error) {
      console.error('Error loading pizzas:', error);
    }
  }

  async loadOrders() {
    try {
      const response = await fetch('/api/orders');
      const data = await response.json();
      this.orders = data.data || [];
    } catch (error) {
      console.error('Error loading orders:', error);
    }
  }

  renderPizzaList() {
    return this.pizzas.map(pizza => `
      <div class="pizza-card">
        <h3>${pizza.name}</h3>
        <p class="price">R$ ${pizza.price}</p>
        <p class="ingredients">${pizza.ingredients.join(', ')}</p>
        <button class="order-btn" data-pizza-id="${pizza.id}">
          Pedir Agora 🍕
        </button>
      </div>
    `).join('');
  }

  renderOrders() {
    if (this.orders.length === 0) {
      return '<p class="no-orders">Nenhum pedido realizado ainda.</p>';
    }

    return this.orders.map(order => `
      <div class="order-card">
        <div class="order-header">
          <strong>Pedido #${order.id}</strong>
          <span class="order-status ${order.status}">${order.status}</span>
        </div>
        <div class="order-details">
          <p><strong>Cliente:</strong> ${order.customerName}</p>
          <p><strong>Itens:</strong> ${order.items}</p>
          <p><strong>Total:</strong> R$ ${order.total}</p>
          <p><strong>Data:</strong> ${new Date(order.createdAt).toLocaleString()}</p>
        </div>
      </div>
    `).join('');
  }

  render() {
    return `
      <div class="dashboard">
        <header class="dashboard-header">
          <h1>🍕 PizzaFlow Dashboard</h1>
          <div class="stats">
            <div class="stat-card">
              <h3>${this.pizzas.length}</h3>
              <p>Pizzas no Cardápio</p>
            </div>
            <div class="stat-card">
              <h3>${this.orders.length}</h3>
              <p>Pedidos Hoje</p>
            </div>
          </div>
        </header>

        <div class="dashboard-content">
          <section class="pizza-section">
            <h2>Cardápio</h2>
            <div class="pizza-grid">
              ${this.renderPizzaList()}
            </div>
          </section>

          <section class="orders-section">
            <h2>Pedidos Recentes</h2>
            <div class="orders-list">
              ${this.renderOrders()}
            </div>
          </section>
        </div>
      </div>
    `;
  }

  setupEventListeners() {
    // Add order button listeners
    document.querySelectorAll('.order-btn').forEach(btn => {
      btn.addEventListener('click', (e) => {
        const pizzaId = e.target.dataset.pizzaId;
        this.openOrderModal(pizzaId);
      });
    });
  }

  openOrderModal(pizzaId) {
    const pizza = this.pizzas.find(p => p.id == pizzaId);
    if (pizza) {
      // Implementation for order modal
      alert(`Pedir ${pizza.name} por R$ ${pizza.price}`);
    }
  }
}

module.exports = Dashboard;