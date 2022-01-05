# frozen_string_literal: true

require_relative 'account_balance'

class Account
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
  end

  def deposit(credit, date)
    @transactions << [(sprintf '%.2f', credit), date]
  end

  def withdrawal(debit, date)
    @transactions << [(sprintf '%.2f', -debit), date]
  end

  def statement_header
    puts "\n   date    ||  credit ||  debit  ||  balance"
  end

  def account_statement
    statement_header
    add_balance.map { |amount, date, balance|
      if amount.to_i >= 0
        puts "#{date} || #{amount} ||         ||  #{balance}"
      else
        puts "#{date} ||         || #{sprintf "%.2f",-amount.to_i}  ||  #{balance}"
      end
    }
  end

  def arrange_by_date
    by_date_newest_first = @transactions.reverse { |x, y| x["date"] <=> y["date"] }
    by_date_newest_first.reverse { |x, y| x["date"] <=> y["date"] } # this gets multidimensional
    # array sorted by date
  end

  def add_balance
    balance = 0
    balance_array = []
    arrange_by_date.map { |amount, date| balance_array << (sprintf "%.2f", (balance += amount.to_i)) }
    # although date element not used, if it is removed, I am unable to iterate through array and get balance. Please leave in code.
    transactions_with_balance = arrange_by_date.zip(balance_array).map(&:flatten).reverse { |x, y| x["date"] <=> y["date"] }
    p transactions_with_balance
  end

  private

  def test_formatting
    account = Account.new
    account.deposit(1000, '10-01-2023')
    account.deposit(2000, '13-01-2023')
    account.withdrawal(500, '14-01-2023')
    puts account.account_statement
  end
end
