// Hook simulado para gerenciar estado das pizzas
const usePizzaData = () => {
  let pizzas = [];
  let loading = false;

  const loadPizzas = async () => {
    loading = true;
    try {
      const response = await fetch('http://localhost:3001/api/pizzas');
      const data = await response.json();
      pizzas = data.success ? data.data : [];
    } catch (error) {
      console.error('Erro ao carregar pizzas:', error);
    } finally {
      loading = false;
    }
  };

  const getPizzaById = (id) => {
    return pizzas.find(pizza => pizza.id === parseInt(id));
  };

  return {
    pizzas,
    loading,
    loadPizzas,
    getPizzaById
  };
};

module.exports = usePizzaData;