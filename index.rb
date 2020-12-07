require "tty-prompt"

def welcome
    categories = [
        {name: "Arts", value: 1},
        {name: "Science", value: 2},
        {name: "History", value: 3}
    ]
    prompt = TTY::Prompt.new
    intro = File.read('intro.txt')
    puts intro
    puts ""
    puts ""
    puts "Welcome to Terminal Trivia!"
    puts "Please select a category to get started!"
    prompt.select("Which category?", categories)
end

welcome