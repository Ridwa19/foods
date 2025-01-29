const mongoose = require('mongoose');

const accountSchema = new mongoose.Schema({
    title: { type: String, required: true },
    userId: { type: mongoose.Schema.Types.ObjectId, required: true, ref: 'User' },
    debit: { type: Number, default: 0 },
    credit: { type: Number, default: 0 },
    createdDate: { type: Date, default: Date.now },
});

module.exports = mongoose.model('Account', accountSchema);
