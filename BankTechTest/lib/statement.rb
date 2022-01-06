# frozen_string_literal: true

require_relative 'account'
# formats record of transactions
class Statement

  def build_statement(transactions)
    printed_statement = ''
    add_balance_of_transactions(transactions)
    printed_statement += statement_header
    transactions.sort! { |x, y| y.getDate <=> x.getDate }
    transactions.map do |transaction|
      printed_statement += transaction.getAmount.positive? ? deposit_format(transaction) : withdrawal_format(transaction)
    end
    printed_statement
  end

  private

  # please do not change formatting.  Although columns are not aligned it matches the acceptance criteria
  def deposit_format(transaction)
    "#{transaction.getDate} || #{format '%.2f',
                                        transaction.getAmount} || || #{format '%.2f', transaction.getCurrentBalance}\n"
  end

  def withdrawal_format(transaction)
    "#{transaction.getDate} || || #{format '%.2f',
                                           -transaction.getAmount} || #{format '%.2f', transaction.getCurrentBalance}\n"
  end

  def statement_header
    "date || credit || debit || balance \n"
  end

  def add_balance_of_transactions(transactions)
    current_balance = 0
    transactions.sort! { |x, y| x.getDate <=> y.getDate }
    transactions.map { |transaction| transaction.setCurrentBalance(current_balance += transaction.getAmount) }
  end
end
