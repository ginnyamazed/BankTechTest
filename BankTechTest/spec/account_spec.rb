# frozen_string_literal: true

require_relative '../lib/account'
require_relative 'account_transactions'

describe 'account' do
  # 'keeps track of account transactions' do
  let (:account) { Account.new }

  describe 'deposit' do
    it 'accepts a credit transaction' do
      account.deposit(1000, '10-01-2023')
      expect(account.transactions).to include(["1000.00", '10-01-2023'])
    end
  end

  describe 'withdrawal' do
    it 'accepts a debit transaction' do
      account.withdrawal(500, '14-01-2023')
      expect(account.transactions).to include(["-500.00", '14-01-2023'])
    end
  end

  describe 'account balance' do
    it 'adds a balance element the transaction array and organizes it by date order' do
      transactions
      expect(account.account_balance).to eq([["-500.00", "14-01-2023", "2500.00"], ["2000.00", "13-01-2023", "3000.00"], ["1000.00", "10-01-2023", "1000.00"]])
    end
  end

  describe 'account statement' do
    it 'prints out a list of transactions and balance after each transaction' do
      transactions
      expect { puts(account.account_statement) }.to output.to_stdout
    end
  end
end
