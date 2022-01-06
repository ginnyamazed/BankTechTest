const Deposit = require('../lib/deposit');

describe('deposit', () => {
    it('credits account', () => {
        const deposit = new Deposit(1000, '10-01-2023');
        expect(deposit.getAmount()).toBe(1000);
    });
});
// it 'accepts a credit transaction' do
//     account.deposit(1000, '10-01-2023')
//     expect(account.transactions).to include(%w[1000.00 10-01-2023])
// end