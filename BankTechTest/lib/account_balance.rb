# # frozen_string_literal: true
#
# require_relative 'account'
#
# class AccountBalance
#
#   def self.arrange_by_date
#     account = Account.new
#     by_date_newest_first = account.transactions
#     by_date_newest_first.reverse { |x, y| x["date"] <=> y["date"] }
#     new_array = by_date_newest_first.reverse { |x, y| x["date"] <=> y["date"] } # this gets multidimensional
#     # array sorted by date
#     new_array
#   end
#
#   def self.add_balance
#     balance = 0
#     balance_array = []
#     arrange_by_date.map { |amount, date| balance_array << (sprintf "%.2f", (balance += amount.to_i)) }
#     # although date element not used, if it is removed, I am unable to iterate through array and get balance. Please leave in code.
#     transactions_with_balance = arrange_by_date.zip(balance_array).map(&:flatten).reverse { |x, y| x["date"] <=> y["date"] }
#     p transactions_with_balance
#   end
# end
