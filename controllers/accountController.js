const Account = require('../models/Account');

exports.createAccount = async (req, res) => {
    try {
        const account = new Account(req.body);
        const savedAccount = await account.save();
        res.status(201).json(savedAccount);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

exports.getAccounts = async (req, res) => {
    try {
        const accounts = await Account.find();
        res.json(accounts);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.updateAccount = async (req, res) => {
    try {
        const { id } = req.params;
        const updatedAccount = await Account.findByIdAndUpdate(id, req.body, { new: true, runValidators: true });
        if (!updatedAccount) {
            return res.status(404).json({ error: 'Account not found' });
        }
        res.json(updatedAccount);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

// Delete an account
exports.deleteAccount = async (req, res) => {
    try {
        const { id } = req.params;
        const deletedAccount = await Account.findByIdAndDelete(id);
        if (!deletedAccount) {
            return res.status(404).json({ error: 'Account not found' });
        }
        res.json({ message: 'Account deleted successfully' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};