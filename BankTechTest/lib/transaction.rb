# frozen_string_literal: true

# class to create a new transaction to go to account instance
class Transaction

  def initialize(amount, date)
    @amount = amount
    @date = date
  end

  def getAmount
    @amount
  end

  def getDate
    @date
  end
end
