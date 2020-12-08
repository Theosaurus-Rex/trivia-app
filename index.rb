require "tty-prompt"

def welcome
    intro = File.read('intro.txt')
    puts intro
    puts ""
    puts ""
    puts "Welcome to Terminal Trivia!"
    
end

def category_select
    categories = [
        {name: "Art", value: 1},
        {name: "General Knowledge", value: 2},
    ]
    prompt = TTY::Prompt.new
    puts "Please select a category to get started!"
    prompt.select("Which category?", categories)
end

welcome
category_select