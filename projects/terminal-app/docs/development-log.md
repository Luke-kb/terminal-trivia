## DEVELOPMENT LOG 
------------------
#### 22/4/20

Realised that the countries gem was not going to work as expected. The information provided was not extensive enough, and required too much hard coding to provide questions. Some googling took me to the Open Trivia Database. This made everything simpler as the multiple choice answer and other options were all contained in an object that was accessible via their api. To make the data fetching process simpler I decided to use HTTParty gem. 

#### 23/4/20

For a few days, the HTML entities (eg &quot?) was bothering me as I couldn't find a solution. The entities would mess up the display of the questions and answers. Found a gem called htmlentities that fixed it! 

#### 24/4/20

Couldn't get a table to work for the results. Tried Terminal-table, tabulo, tty-table. All had issues with either text wrapping or layout that was frustrating. Decided to forget the table, instead printing the results. Borrowed the idea from tty-table of pushing the results to an array during the quiz loop and then printing that back out on the results page.

#### 25/4/20

Refactored the code in QuestionBank.rb and Score.rb to initialize the score results and count as well as question amount and question index. Doing this temporarily broke the score results so solution was to to expand the quiz method (called in app.rb) rather than joining smaller methods together.


  