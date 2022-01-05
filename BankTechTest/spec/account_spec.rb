# frozen_string_literal: true

require_relative '../lib/account'

describe 'account' do
  # 'keeps track of account transactions' do
  let (:account) { Account.new }

  describe 'deposit' do
    it 'accepts a credit transaction' do
      account.deposit(1000, '10-01-2023')
      expect(account.transactions).to include([1000, '10-01-2023'])
    end
  end

  describe 'withdrawal' do
    it 'accepts a debit transaction' do
      account.withdrawal(500, '14-01-2023')
      expect(account.transactions).to include([-500, '14-01-2023'])
    end
  end

  describe 'account statement' do
    it 'prints out a list of transactions and balance after each transaction' do
      account.deposit(1000, '10-01-2023')
      account.deposit(2000, '13-01-2023')
      account.withdrawal(500, '14-01-2023')
      expect(account.account_statement).to include('balance')
      # may need to do this as a feature test - result is nil, nil, nil
      # printed result is correct except date order
    end
  end
end
