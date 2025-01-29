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
exports.updateTransaction = async (req, res) => {
    try {
        const { id } = req.params;
        const updatedTransaction = await Transaction.findByIdAndUpdate(id, req.body, { new: true, runValidators: true });
        if (!updatedTransaction) {
            return res.status(404).json({ error: 'Transaction not found' });
        }
        res.json(updatedTransaction);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

// Delete a transaction
exports.deleteTransaction = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedTransaction = await Transaction.findByIdAndDelete(id);
        if (!deletedTransaction) {
            return res.status(404).json({ error: 'Transaction not found' });
        }
        res.json({ message: 'Transaction deleted successfully' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};