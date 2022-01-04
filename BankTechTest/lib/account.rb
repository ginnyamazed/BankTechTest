# frozen_string_literal: true

class Account
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(credit, date)
    @transactions << [credit, date]
  end

  def withdrawal(debit, date)
    @transactions << [-debit, date]

  end

end
