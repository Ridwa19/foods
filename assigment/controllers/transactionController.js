const Transaction = require('../models/Transaction');

exports.createTransaction = async (req, res) => {
    try {
        const transaction = new Transaction(req.body);
        const savedTransaction = await transaction.save();
        res.status(201).json(savedTransaction);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

exports.getTransactionsByUser = async (req, res) => {
    try {
        const transactions = await Transaction.find({ userId: req.params.userId });
        res.json(transactions);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
