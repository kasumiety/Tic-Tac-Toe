# Tic-Tac-Toe

This is a two-player Tic-Tac-Toe game played in the command line. Writing it took me a bit to get my head around, considering that it's the first learning project I did using object-oriented programming.

It's fairly basic and done-to-spec(available at [The Odin Project](https://www.theodinproject.com/lessons/ruby-tic-tac-toe)), without any real extra features.
I opted for a slightly more complex solution for checking if a player has won the game - I'm aware of the easier route of hard-coding all of the Tic-Tac-Toe win combinations and checking the board for them, but I decided to challenge myself and write a method that checks columns, rows and diagonals using several helper methods.

I might come back to this one day to things such as:
- Basic AI
- Support for custom board sizes (would require major refactoring)
- Unit tests