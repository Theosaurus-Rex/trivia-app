require "tty-prompt"
require "./player-class"
require "./art"
require "./general_knowledge"
require "./books"
require "./film"
require "./music"
require "./theatre"
require "./television"
require "./games"
require"./boardgames"
require "./nature"



def welcome
    pastel = Pastel.new
    intro = File.read('intro.txt')
    puts pastel.cyan(intro)
    puts ""
    puts ""
    puts pastel.cyan("Welcome to Terminal Trivia!")
    
end

def main_menu
    pastel = Pastel.new
    menu_options = [
        {name: "New Game", value: 1},
        {name: "Score Board", value: 2},
        {name: "Exit", value: 3}
    ]
    prompt = TTY::Prompt.new
    user_input = prompt.select("Select an option:", menu_options)
    case user_input
    when 1
        new_game
    when 2
        display_scores
    when 3
        puts pastel.cyan("See you next time!")
        exit(0)
    end
end

def new_game
    pastel = Pastel.new
    puts pastel.cyan("Let's play! Please tell me your name:")
    input = gets.chomp
    $player = Player.new(input)
    puts pastel.cyan("Okay, thanks #{$player.name}! This will be used next to your scores on the score board.")
    category_select
end

def category_select
    categories = [
        {name: "Art", value: 1},
        {name: "General Knowledge", value: 2},
        {name: "Books", value: 3},
        {name: "Film", value: 4},
        {name: "Music", value: 5},
        {name: "Theatre", value: 6},
        {name: "Television", value: 7},
        {name: "Video Games", value: 8},
        {name: "Board Games", value: 9},
        {name: "Science & Nature", value: 10}
    ]
    selection = TTY::Prompt.new
    pastel = Pastel.new
    puts pastel.cyan("Please select a category to get started!")
    user_choice = selection.select("Which category?", categories)
    case user_choice
    when 1
        art_quiz
    when 2
        general_knowledge_quiz
    when 3
        books_quiz
    when 4
        film_quiz
    when 5
        music_quiz
    when 6
        theatre_quiz
    when 7
        television_quiz
    when 8
        games_quiz
    when 9
        boardgames_quiz
    when 10
        nature_quiz
    else 
        puts pastel.red("Error! Please select a category")
        category_select
    end
end

def display_scores
    pastel = Pastel.new
    scores = File.read("scores.txt")
    puts scores
    puts pastel.cyan("Press any key to return to Main Menu")
    gets
    main_menu
end

def finish_quiz
    pastel = Pastel.new
    puts pastel.cyan("WelL done!")
    puts pastel.cyan("You got #{$player.score} out of 10 answers correct!")
    scoreboard = File.open('scores.txt', 'a') do |f1| f1.write("\n#{$player.name} scored #{$player.score} / 10 in #{$category}")
    end
    $player.score = 0
    puts " "
    puts " "
    new_game = [
        {name: "Yes", value: 1},
        {name: "No", value: 2}
    ]
    prompt = TTY::Prompt.new
    user_input = prompt.select("Would you like to try another category?", new_game)
    if user_input == 1
        category_select
    else
        main_menu
    end
end

welcome
main_menu

