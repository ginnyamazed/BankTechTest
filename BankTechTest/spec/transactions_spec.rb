# frozen_string_literal: true

require_relative '../lib/transaction'

describe 'transactions' do
  it 'creates a new transaction' do
    transaction = Transaction.new(1000, Date.new(2023,10,1))
    expect(transaction.getAmount).to eq(1000)
    expect(transaction.getDate).to eq(10-01-2023)
  end
end


