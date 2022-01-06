# BankTechTest

This simple application allows interaction with a REPL to enter deposits and withdrawals.  The user can also retrieve an 
account statement that shows any deposits or withdrawals that have occurred and the correlating balance for each transaction.  

## App Requirements
You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to 
implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria
Given a client 
- makes a deposit of 1000 on 10-01-2023
- And a deposit of 2000 on 13-01-2023
- And a withdrawal of 500 on 14-01-2023
- When she prints her bank statement she would see:

<pre>
  date     || credit  ||  debit  || balance
14/01/2023 ||         ||  500.00 || 2500.00
13/01/2023 || 2000.00 ||         || 3000.00
10/01/2023 || 1000.00 ||         || 1000.00
</pre>

### Installation
To use codebase on your computer, Use bundle install to load needed gems.  Otherwise, no installation is necessary.
```bash
$ bundle install
```

## Usage
Open terminal
```
$ irb
> require '<file path>/account.rb'
=> true
account = Account.new
account.deposit(1000, '10-01-2023')
account.deposit(2000, '13-01-2023')
account.withdrawal(500, '14-01-2023')
puts account.account_statement

```
![](Desktop/Screenshot 2022-01-05 at 17.53.44.png)

## Design/Architecture

This project was an opportunity to work in a solo environment while practicing OO design and TDD skills. I used Ruby as
this is currently my most comfortable programming language.

I approached the project using a single class object as it is a clear way to meet all project requirements and stay 
simple and readable.  The object includes a transactions array.  The functions of the 
class is to add deposits, make withdrawals, and obtain a statement. 

During the coding I faced delays due to attempting to use an incorrect RSpec matcher for the type of object I was 
working with.  Further work would seek to implement additional edge case testing and data entry checks. It would also 
attempt to separate the app into at least 1 additional class.

### Tests
RSpec is being used for testing. To run the tests
- open a terminal window
- change directory to the directory you have saved the app in
- run rspec

### License
[MIT](https://choosealicense.com/licenses/mit/)
