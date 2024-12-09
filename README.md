# Two-O-Player-Math-Game

## Game Class
### Instance Variables
- Player 1 Object
- Player 2 Object
- Current Player
### Methods
- Start Game
- LOOP
  - Ask Question
    - Generate Random Number
  - Get Answer
  - Validate Answer
    - Answer Correct?
      - Increase Player Score
    - Else Answer Incorrect?
      - End Life
      - Is Last Life?
        - GOTO End Game
  - Change Current Player
- End Game

## Player Class
### Instance Variables
- Lives Remaining
- Score
### Methods
- Kill Life
- Increase Score


