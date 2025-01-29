const express = require('express');
const { createTransaction, getTransactionsByUser } = require('../controllers/transactionController');

const router = express.Router();

router.post('/', createTransaction);
router.get('/user/:userId', getTransactionsByUser);

module.exports = router;
