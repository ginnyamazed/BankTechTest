# frozen_string_literal: true

require_relative '../lib/account'
require_relative 'account_transactions'

describe 'account' do # 'keeps track of account transactions'
  let(:account) { Account.new }

  it 'accepts a credit transaction' do
    account.deposit(1000, '10-01-2023')
    expect(account.transactions).to include(%w[1000.00 10-01-2023])
  end

  it 'accepts a debit transaction' do
    account.withdrawal(500, '14-01-2023')
    expect(account.transactions).to include(%w[-500.00 14-01-2023])
  end

  it 'adds a balance element the transaction array and organizes it by date order' do
    enter_transactions
    expect(account.add_balance_to_transactions).to eq([%w[-500.00 14-01-2023 2500.00], %w[2000.00 13-01-2023 3000.00],
                                                       %w[1000.00 10-01-2023 1000.00]])
  end

  describe 'account statement integration/feature test' do
    it 'prints out a list of transactions and balance after each transaction' do
      enter_transactions
      expect { puts(account.account_statement) }.to output.to_stdout
    end
  end
end
