const Transactions = require('../lib/transactions');
const Deposit = require("../lib/deposit");

describe('Transactions', () => {
    it('adds a record', () => {
        let transactions = new Transactions;
        transactions.addRecord(new Deposit(1000, '10-01-2023'));
        let expected = this.records;
        expect([1000]).toEqual(expect.arrayContaining(expected));
    });
});