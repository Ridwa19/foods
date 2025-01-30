const express = require('express');
const { createTransaction, getTransactionsByUser, updateTransaction,
    deleteTransaction } = require('../controllers/transactionController');

const router = express.Router();

router.post('/', createTransaction);
router.get('/user/:userId', getTransactionsByUser);
router.put('/:id', updateTransaction);

// Delete a transaction
router.delete('/:id', deleteTransaction);


module.exports = router;
