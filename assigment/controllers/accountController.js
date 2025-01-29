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
