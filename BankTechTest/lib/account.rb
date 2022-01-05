# frozen_string_literal: true

class Account
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(credit, date)
    @transactions << [credit, date]
  end

  def withdrawal(debit, date)
    @transactions << [-debit, date]
  end

  def statement_header
    puts "\n""   date    || credit || debit || balance"
  end

  def account_statement
    statement_header
    balance = 0
   # p by_date_newest_first = @transactions.reverse { |x, y| x["date"] <=> y["date"] }
   #  p by_date_oldest_first = by_date_newest_first.reverse { |x, y| x["date"] <=> y["date"] }
   #
   #  by_date_oldest_first.each { |amount, date| by_date_oldest_first << (balance += amount) }
   #  p by_date_oldest_first
  #   by_date = @transactions.reverse { |x, y| x["date"] <=> y["date"] }
  #   p by_date
    @transactions.map { |amount, date|
      if amount >= 0
        puts "#{date} ||  #{amount}  ||       || #{balance += amount}"
      else
        puts "#{date} ||        ||  #{-amount}  ||  #{balance += amount}"
      end
     }
  end

end
