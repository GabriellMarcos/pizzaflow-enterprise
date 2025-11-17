// Componente de card de pizza
class PizzaCard {
  constructor(pizza) {
    this.pizza = pizza;
  }

  render() {
    return `
      <div class="pizza-card">
        <h3>${this.pizza.name}</h3>
        <p class="price">R$ ${this.pizza.price}</p>
        <p class="ingredients">${this.pizza.ingredients.join(', ')}</p>
        <button class="order-btn" data-pizza-id="${this.pizza.id}">
          Pedir Agora
        </button>
      </div>
    `;
  }
}

module.exports = PizzaCard;