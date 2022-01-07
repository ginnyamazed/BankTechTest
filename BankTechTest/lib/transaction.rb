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

  def update_current_balance(amount)
    @current_balance = amount
  end

end
