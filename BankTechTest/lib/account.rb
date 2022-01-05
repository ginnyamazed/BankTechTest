# frozen_string_literal: true

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
    account_balance.map { |amount, date, balance|
      if amount.to_i >= 0
        puts "#{date} || #{amount} ||         ||  #{balance}"
      else
        puts "#{date} ||         || #{sprintf "%.2f",-amount.to_i}  ||  #{balance}"
      end
    }
  end

  def account_balance
    balance = 0
    balance_array = []
    by_date_newest_first = @transactions.reverse { |x, y| x["date"] <=> y["date"] }
    by_date_oldest_first = by_date_newest_first.reverse { |x, y| x["date"] <=> y["date"] } # this gets multidimensional
    # array sorted by date

    by_date_oldest_first.map { |amount, date| balance_array << (sprintf "%.2f", (balance += amount.to_i)) }
    transactions_with_balance = by_date_oldest_first.zip(balance_array).map(&:flatten)
    transactions_with_balance.reverse { |x, y| x["date"] <=> y["date"] }
  end
end
