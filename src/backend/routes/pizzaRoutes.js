const express = require('express');
const pizzaController = require('../controllers/pizzaController');

const router = express.Router();

router.get('/', pizzaController.getAllPizzas);
router.get('/:id', pizzaController.getPizzaById);
router.post('/', pizzaController.createPizza);

module.exports = router;