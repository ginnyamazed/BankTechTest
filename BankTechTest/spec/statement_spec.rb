# frozen_string_literal: true

require_relative '../lib/statement'
require_relative '../lib/transaction'
require_relative 'test_helper'

describe 'statement' do
  let(:statement) { Statement.new }
  let(:t1) { Transaction.new(1000, '10-01-2023') }
  let(:t2) { Transaction.new(2000, '13-01-2023') }
  let(:t3) { Transaction.new(-500, '14-01-2023') }
  let(:output_string) { printed_output }
  let(:transaction_array) { [t1, t2, t3] }
  it 'formats a statement header' do
    expect(statement.build_statement(transaction_array)).to eq(output_string)

  end
end

