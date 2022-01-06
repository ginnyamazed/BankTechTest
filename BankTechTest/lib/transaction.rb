# frozen_string_literal: true

require 'date'

# class to create a new transaction to go to account instance
class Transaction

  attr_reader :amount, :date, :current_balance
  def initialize(amount, date)
    @amount = amount
    @date = date
    @current_balance = 0
  end

  def getAmount
    @amount
  end

  def getDate
    @date
  end

  def setCurrentBalance(amount)
    @current_balance = amount
  end

  def getCurrentBalance
    @current_balance
  end
end
