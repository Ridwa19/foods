require('dotenv').config();
const express = require('express');
const mongoose = require('./config/db');
const accountRoutes = require('./routes/accountRoutes');
const transactionRoutes = require('./routes/transactionRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Routes
app.use('/accounts', accountRoutes);
app.use('/transactions', transactionRoutes);

app.listen(PORT, () => {
    console.log(`Server running on port${PORT}`);
});