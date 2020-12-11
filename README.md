# Ruby Trivia Game

## Repository Link
[Github Repository](https://github.com/Theosaurus-Rex/trivia-app)

## Software Development Plan

### Purpose & Scope
*Terminal Trivia* is a CLI trivia game that tests players' knowledge in a series of multiple choice questions. It aims to be simple to use and interact with, and provide entertainment for those who want a fun single-player game where the questions are randomized each time to avoid repetition. 
This game is aimed at ages 13+ due to the large amount of reading required. The application can be launched by running the `install-and-run.sh` file in the "src" folder.

### Features
- **Categories:** More than twenty different themed categories for you to pick from! Includes specialty topics such as Mythology and Anime & Manga
- **Scoring System:** Record your scores with your name and category on the scoreboard to test yourself against your friends
- **Intuitive Interface:** This app utilises *TTY-Prompt* to enable input selection with the arrow keys, so there's no need to type your answer selection!

### Installation & Use
To install and run, download the provided files and run `install-and-run.sh` to play!
Please note that this app may not function as intended in bash terminals due to the reliance on tty-prompt for answer selection.

Users can use the command `-h` or `--h` to display a help menu for how to use the game.

Users will be asked to enter their name when starting a new game so that their score can be recorded to the scoreboard. The scoreboard with high scores can be accessed from the Start menu. 

When answering questions or selecting a category, users can choose their input using the arrow keys on their keyboard. When this is an option, a text prompt will display to indicate how to interact with the various menus in-game.

Due to the nature of the arrow-select interface, user input errors are minimised. In cases where errors do occur, a text prompt will display explaining the nature of the error to the user.

### Control Flow Diagram
![Control Flow Diagram](./docs/terminal_trivia.png)

## Implementation Plan

### Questions, Answers and Categories
All questions, answers, and categories are generated from the [Open Trivia Database](https://opentdb.com/api_config.php) API. This is a free API where users can contribute questions freely, that are then approved and added. This means that the game will always have new questions to answer!
Decoding is implemented using a custom module within the source code to replace HTML entities with the correct characters to ensure readability of question and answer content.

**Checklist:**
- API Integration
- Implementation of different categories
- Separating questions and answers for each piece of question data recieved
- Testing for encrypted output
- Decoding encrypted output

### Score System
To maintain consistency, the scoreboard will be stored in an external file that will be read and written to by the Trivia application. The scoreboard will contain the Player name, the category they picked, and their score for that category. Where scores are tied, the most recent score will be displayed at the top.

**Checklist:**
- Create document for score board storage
- Implement method to get player name input
- Implement method to add to player score when correct answer is selected
- Implement method to write score to score board
- Implement method to read score board and display to terminal when Scores option selected from Start Menu
- Time permitting, style score board output using coloured text to differentiate sections

### User Interface
The trivia application will utilise the Ruby Gem [TTY-Prompt](https://ttytoolkit.org/) to make interfacing as smooth and hassle-free as possible for the player. This gem will allow players to use their arrow keys to select answers instead of manually typing in their selection.

**Checklist:**
- Integrate TTY-Prompt into application
- Add arrays for prompt selection on start menu and category select menu
- Create method for TTY Shell Command `--help`
- Obtain user testing feedback on system interfacing
- Test that interfacing works on question selection for each quiz category



