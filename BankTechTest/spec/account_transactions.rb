def enter_transactions
  account.deposit(1000, '10-01-2023')
  account.deposit(2000, '13-01-2023')
  account.withdrawal(500, '14-01-2023')
end