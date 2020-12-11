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



def welcome
    intro = File.read('intro.txt')
    puts intro
    puts ""
    puts ""
    puts "Welcome to Terminal Trivia!"
    
end

def main_menu
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
        puts "See you next time!"
        exit(0)
    end
end

def new_game
    puts "Let's play! Please tell me your name:"
    input = gets.chomp
    $player = Player.new(input)
    puts "Okay, thanks #{$player.name}! This will be used next to your scores on the score board."
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
        {name: "Video Games", value: 8}
    ]
    selection = TTY::Prompt.new
    puts "Please select a category to get started!"
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
    else 
        puts "Error! Please select a category"
        category_select
    end
end

def display_scores
    scores = File.read("scores.txt")
    puts scores
    puts "Press any key to return to Main Menu"
    gets
    main_menu
end

def finish_quiz
    puts "WelL done!"
    puts "You got #{$player.score} out of 10 answers correct!"
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

