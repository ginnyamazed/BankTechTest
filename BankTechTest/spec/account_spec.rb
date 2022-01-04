# frozen_string_literal: true

require_relative '../lib/account'

describe 'account' do
  # 'keeps track of account transactions' do
  let (:account) { Account.new }

  describe 'deposit' do
    it 'accepts a credit transaction' do
      account.deposit(1000, '10-01-2023')
      expect(account.transactions).to include('credit' => 1000, 'date' => '10-01-2023')
    end
  end

  describe 'withdrawal' do
    it 'accepts a debit transaction' do
      account.withdrawal(500, '14-01-2023')
      expect(account.transactions).to include('debit' => 500, 'date' => '14-01-2023')
    end
  end
end
