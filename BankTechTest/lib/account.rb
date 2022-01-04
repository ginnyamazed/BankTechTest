# frozen_string_literal: true

class Account
  attr_reader :transactions

  def initialize
    @transactions = {}
  end

  def deposit(credit, date)
    @transactions['credit'] = credit
      @transactions['date'] = date
  end

  def withdrawal(debit, date)
    @transactions['debit'] = debit
    @transactions['date'] = date
  end

end
