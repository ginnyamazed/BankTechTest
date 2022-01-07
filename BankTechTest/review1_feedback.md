## Review
Great work! A few important changes are needed though — but remember this is the most likely outcome on a first try of this challenge! You should now spend some time revisiting the code in light of the feedback and make the necessary changes. Don't hesitate to DM/ask me about anything that's unclear or you'd like more details on :)

#### Positive points:

- Clear README with instructions
- It works and the output matches the acceptance criteria
- Methods and variables names are clear and readable, and the code is concise
- All tests pass
- Overall the tests are written in a clear way
- The implementation of the transactions list is neat and simple

#### Major changes:

- There should be at least a second class to handle the output & formatting logic — and Account should delegate to this component to print the statement. You'd also have to mock the dependency on this second class in Account unit tests. The Account class would pass the list of transactions to this component so it can print the output table.
- The formatting of amounts should also be handled by this new class — in other words, they should be stored as "raw" numeric values in the transactions list, and only formatted to strings when printing the statement, as this is part of the presentation logic
- The test adds a balance element the transaction array and organizes it by date order' tests for the internal state of the Account class (it verifies how transactions is stored internally) — what we're interested in testing is more the behaviour of this class (e.g that it delegates correctly to the component responsible to print the output statement). In the test just below ('prints out a list of transactions and balance after each transaction'), the output itself should be tested against the string it needs to look like.

#### Minor things:

- The code that generates the output table can be simplified (more specifically the method add_balance_to_transactions) — you could sort and then iterate directly on the transaction list, and keep a running balance variable by continously adding/substracting the amounts to it, and use this value in the output. Unless you wanted to write in a more functional style, in this case having add_balance_to_transactions makes sense before iterating.
- The internal methods such as arrange_array_by_date could be set as private.
- The files with commented code could be removed
- The README instructs to run bundle install but there is no Gemfile in the directory
- The blank cells from the program's table output are not exactly like on the acceptance criteria