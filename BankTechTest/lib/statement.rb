# frozen_string_literal: true

require_relative 'account'

# pulls in record of transactions and formats
class Statement


  def statement_header
    puts "\n   date    ||  credit ||  debit  ||  balance"
  end

  def build_statement(transactions)
    current_balance = 0
    statement_header
    #first sort the array in date asc
    transactions.sort! { |x, y| x.getDate <=> y.getDate }
    #then calculate the transaction balance and set on each transaction in the right order
    transactions.map do |transaction|
      current_balance += transaction.getAmount
      transaction.setCurrentBalance(current_balance)
    end
    # reverse the order and print
    transactions.sort! { |x, y| y.getDate <=> x.getDate }
    transactions.map  do |transaction|
      puts "#{transaction.getDate} || #{transaction.getAmount} ||         ||  #{transaction.getCurrentBalance}"
    end
  end
end
