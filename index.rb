require "tty-prompt"
require "./art"


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
    $name = gets.chomp
    puts "Okay, thanks #{$name}! This will be used next to your scores on the score board."
    category_select
end

def category_select
    categories = [
        {name: "Art", value: 1},
    ]
    prompt = TTY::Prompt.new
    puts "Please select a category to get started!"
    user_input = prompt.select("Which category?", categories)
    case user_input
    when 1
        art_quiz
    else 
        puts "Error! Please select a category"
        category_select
    end
end

def finish_quiz
    puts "WelL done!"
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
        puts "See you next time!"
    end
end

welcome
main_menu

