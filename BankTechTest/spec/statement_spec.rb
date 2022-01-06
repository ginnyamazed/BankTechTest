# frozen_string_literal: true

require_relative '../lib/account'
require_relative '../lib/statement'

describe 'statement' do
  let(:statement) { Statement.new }

  # it 'prepares an account statement with list and balance of transactions'
#   it 'receives the list of transactions from accounts' do
#     account = Account.new
#     account.deposit(1000, '10-01-2023')
#     account.deposit(2000, '13-01-2023')
#     account.withdrawal(500, '14-01-2023')
#     expect(statement.get_records).to include([%w[-500.00 14-01-2023], %w[2000.00 13-01-2023], %w[1000.00 10-01-2023]])
#   end
# end
# it 'adds a balance element the transaction array and organizes it by date order' do
#   enter_transactions
#   expect(account.add_balance_to_transactions).to eq([%w[-500.00 14-01-2023 2500.00], %w[2000.00 13-01-2023 3000.00],
#                                                      %w[1000.00 10-01-2023 1000.00]])
# end

  it 'formats a statement header' do

  end
end

