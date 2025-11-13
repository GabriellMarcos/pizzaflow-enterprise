import express from "express";
import cors from "cors";
import helmet from "helmet";

const app = express();
const PORT = process.env.PORT || 3001;

// Middlewares
app.use(helmet());
app.use(cors());
app.use(express.json());

// Health check route
app.get("/health", (req, res) => {
  res.json({ 
    status: "OK", 
    timestamp: new Date().toISOString(),
    service: "PizzaFlow Backend"
  });
});

// Pizza menu route
app.get("/api/pizzas", (req, res) => {
  const pizzas = [
    { id: 1, name: "Margherita", price: 25.90 },
    { id: 2, name: "Pepperoni", price: 29.90 },
    { id: 3, name: "Quatro Queijos", price: 32.90 }
  ];
  res.json(pizzas);
});

app.listen(PORT, () => {
  console.log(` PizzaFlow Server running on port ${PORT}`);
});
