const Deposit = require("../lib/deposit");

class Transactions {
    constructor() {
        this.records = [];
    }

    addRecord(item) {
        this.records.push(item);
    }
}

module.exports = Transactions;

