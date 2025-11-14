const pizzas = [
  { id: 1, name: "Margherita", price: 25.90, ingredients: ["molho", "mozzarella", "manjericão"] },
  { id: 2, name: "Pepperoni", price: 29.90, ingredients: ["molho", "mozzarella", "pepperoni"] },
  { id: 3, name: "Quatro Queijos", price: 32.90, ingredients: ["mozzarella", "gorgonzola", "parmesão", "catupiry"] }
];

const pizzaController = {
  getAllPizzas: (req, res) => {
    res.json({
      success: true,
      data: pizzas,
      count: pizzas.length
    });
  },

  getPizzaById: (req, res) => {
    const pizza = pizzas.find(p => p.id === parseInt(req.params.id));
    if (!pizza) {
      return res.status(404).json({ success: false, message: 'Pizza não encontrada' });
    }
    res.json({ success: true, data: pizza });
  },

  createPizza: (req, res) => {
    const { name, price, ingredients } = req.body;
    const newPizza = {
      id: pizzas.length + 1,
      name,
      price,
      ingredients,
      createdAt: new Date().toISOString()
    };
    pizzas.push(newPizza);
    res.status(201).json({ success: true, data: newPizza });
  }
};

module.exports = pizzaController;