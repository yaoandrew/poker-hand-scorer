<h1 align="center">Poker Hand Scorer</h1>
<div align="center">
<strong>This project focuses on applying OO design principles and TDD.</strong>
</div>

## Overview
Users will be prompted to enter a text representation of a 5 card poker hand and 
the program will score the hand based the the set of cards entered. The hands can
entered from the command line as "2H" or "KH" which will represent the Two of Hearts
or King of Hearts respectively.

## Project Structure
The source for the project can be found in the `lib/` folder. Tests can be found in the `spec/` folder.

## Running the test suite
This project uses RSpec (3.5.4) for unit testing and was built with Ruby (2.4.0). You can run the
tests by running `rspec` from the project root. RSpec is setup to run with `--color --format documentation` options set.

## Entering your hand
You hand is represented in text and a card should be entered by the value and suit in that order. It helps to think of 
it as a "Queen of Hearts". When you enter that card, it would be represented on the command line as `QH`. 

Valid values for cards:  
2..10 - numerical cards  
J - Jack  
Q - Queen  
K - King  
A - Ace  

Valid suits for cards:  
H - Hearts  
C - Clubs  
D - Diamonds  
S - Spades  

## Starting the scorer
Start the game by running  `lib/start_hand_scorer.rb` or `ruby lib/start_hand_scorer` from the project root.