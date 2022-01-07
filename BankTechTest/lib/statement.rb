# frozen_string_literal: true

require_relative 'account'
# formats record of transactions
class Statement
  def build_statement(transactions)
    printed_statement = ''
    add_balance_of_transactions(transactions)
    printed_statement += statement_header
    transactions.sort! { |x, y| y.date <=> x.date }
    transactions.map do |transaction|
      printed_statement += transaction.amount.positive? ? deposit_format(transaction) : withdrawal_format(transaction)
    end
    printed_statement
  end

  private

  # please do not change formatting.  Although columns are not aligned it matches the acceptance criteria
  def deposit_format(transaction)
    "#{transaction.date} || #{format '%.2f',
                                     transaction.amount} || || #{format '%.2f', transaction.current_balance}\n"
  end

  def withdrawal_format(transaction)
    "#{transaction.date} || || #{format '%.2f',
                                        -transaction.amount} || #{format '%.2f', transaction.current_balance}\n"
  end

  def statement_header
    "date || credit || debit || balance \n"
  end

  def add_balance_of_transactions(transactions)
    running_balance = 0
    transactions.sort! { |x, y| x.date <=> y.date }
    transactions.map { |transaction| transaction.update_current_balance(running_balance += transaction.amount) }
  end
end
