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
end
