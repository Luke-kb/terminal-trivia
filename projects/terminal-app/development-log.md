DEVELOPMENT LOG
TERMINAL TRIVIA
-----------------

Wednesday 22/4

Realised that the countries gem was not going to work as expected. The information provided was not extensive enough, and required too much hard coding to provide questions. Some googling took me to the Open Trivia Database. This made everything simpler as the multiple choice answer and other options were all contained in an object. 
To make the data fetching process simpler decided to use HTTParty gem. 

Thursday 23/4

For a few days, the HTML entities (eg &quot?) was bothering me as I couldn't find a solution. The entities would mess up the display of the questions and answers. Haven't solved it yet.

Friday 24/4

Couldn't get a table to work for the results. Tried Terminal-table, tabulo, tty-table. All had issues with either text wrapping or layout that was frustrating. Decided to forget the table, instead using puts, but still pushing the results to an array during the quiz loop.

Saturday 25/4

Refactored the code in QuestionBank.rb and Score.rb to initialize the score results and count as well as question amount and question index. Doing this temporarily broke the score results so solution was to to expand the quiz method (called in app.rb) rather than joining smaller methods together.

Sunday 26/4

- 

Monday 27/4

- 