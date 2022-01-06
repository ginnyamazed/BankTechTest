# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'



# enables transactions to be entered and account_statement to be returned
class Account
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(amount, date)
    @transactions << Transaction.new(amount, date)
  end

  def withdrawal(amount, date)
    @transactions << Transaction.new(-amount, date)
  end

  def print_statement
    statement = Statement.new
    statement.build_statement(@transactions)
  end

end
