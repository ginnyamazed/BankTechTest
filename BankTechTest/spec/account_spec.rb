# frozen_string_literal: true

require_relative '../lib/account'
require_relative '../lib/transaction'
require_relative 'account_transactions_spec_helper'

describe 'account' do # 'keeps track of account transactions'
  let(:account) { Account.new }
  let(:deposit_amount) { 1000 }
  let(:deposit_date) { '10-01-2023' }
  let(:withdrawal_amount) { 500 }
  let(:withdrawal_date) { '14-01-2023' }

  it 'accepts a credit transaction' do
    account.deposit(deposit_amount, deposit_date)
    t = account.all_transactions[0]
    expect(t.getAmount).to eq(deposit_amount)
    expect(t.getDate).to eq(deposit_date)
  end

  it 'accepts a debit transaction' do
    account.withdrawal(withdrawal_amount, withdrawal_date)
    t = account.all_transactions[0]
    expect(t.getAmount).to eq(-withdrawal_amount)
    expect(t.getDate).to eq(withdrawal_date)
  end

  it 'prints out a statement' do
    enter_transactions
    expect { account.print_statement }.to output.to_stdout
  end
end
