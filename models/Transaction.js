const mongoose = require('mongoose');

const transactionSchema = new mongoose.Schema({
    amount: { type: Number, required: true },
    userId: { type: mongoose.Schema.Types.ObjectId, required: true, ref: 'User' },
    transactionType: { type: String, enum: ['Expense', 'Income'], required: true },
    transactionDate: { type: Date, default: Date.now },
});

module.exports = mongoose.model('Transaction', transactionSchema);
