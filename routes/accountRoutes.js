const express = require('express');
const { createAccount, getAccounts, updateAccount, deleteAccount } = require('../controllers/accountController');

const router = express.Router();

router.post('/', createAccount);
router.get('/', getAccounts);
// Update account
router.put('/:id', updateAccount);

// Delete account
router.delete('/:id', deleteAccount);


module.exports = router;
