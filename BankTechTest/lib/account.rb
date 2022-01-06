# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

# enables transactions to be entered and account_statement to be returned
class Account
  attr_reader :all_transactions

  def initialize
    @all_transactions = []
  end

  def deposit(amount, date)
    @all_transactions << Transaction.new(amount, date)
  end

  def withdrawal(amount, date)
    @all_transactions << Transaction.new(-amount, date)
  end

  def print_statement
    statement = Statement.new
    puts statement.build_statement(@all_transactions)
  end

end
