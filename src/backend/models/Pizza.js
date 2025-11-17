class Pizza {
  constructor(id, name, price, ingredients) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.ingredients = ingredients;
    this.createdAt = new Date().toISOString();
  }

  validate() {
    if (!this.name || this.name.length < 2) {
      throw new Error('Nome da pizza deve ter pelo menos 2 caracteres');
    }
    if (this.price <= 0) {
      throw new Error('Preço deve ser maior que zero');
    }
    return true;
  }

  toJSON() {
    return {
      id: this.id,
      name: this.name,
      price: this.price,
      ingredients: this.ingredients,
      createdAt: this.createdAt
    };
  }
}

module.exports = Pizza;