require "tty-prompt"
require "./art"
require "./general_knowledge"
require "./books"

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
        {name: "Books", value: 3}
    ]
    prompt = TTY::Prompt.new
    puts "Please select a category to get started!"
    user_input = prompt.select("Which category?", categories)
    case user_input
    when 1
        art_quiz
    when 2
        general_knowledge_quiz
    when 3
        books_quiz
    else 
        puts "Error! Please select a category"
        category_select
    end
end

welcome
category_select
