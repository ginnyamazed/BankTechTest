# frozen_string_literal: true

require_relative 'account_balance'

# enables transactions to be entered and account_statement to be returned
class Account
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposit(credit, date)
    @transactions << [(format '%.2f', credit), date]
  end

  def withdrawal(debit, date)
    @transactions << [(format '%.2f', -debit), date]
  end

  def statement_header
    puts "\n   date    ||  credit ||  debit  ||  balance"
  end

  def account_statement
    statement_header
    add_balance_to_transactions.map do |amount, date, balance|
      if amount.to_i >= 0
        puts "#{date} || #{amount} ||         ||  #{balance}"
      else
        puts "#{date} ||         || #{format '%.2f', -amount.to_i}  ||  #{balance}"
      end
    end
  end

  def arrange_array_by_date
    by_date_newest_first = @transactions.reverse { |x, y| x['date'] <=> y['date'] }
    by_date_newest_first.reverse { |x, y| x['date'] <=> y['date'] } # this gets multidimensional
    # array sorted by date
  end

  def add_balance_to_transactions
    balance = 0
    balance_array = []
    arrange_array_by_date.map { |amount, _date| balance_array << (format '%.2f', (balance += amount.to_i)) }
    # although date element not used, if it is removed, I am unable to iterate through array and get balance. Please
    # leave in code.
    arrange_array_by_date.zip(balance_array).map(&:flatten).reverse { |x, y| x['date'] <=> y['date'] }
  end
end
