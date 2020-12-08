require 'httparty'
require "tty-prompt"

class BooksTrivia
    include HTTParty
    base_uri 'opentdb.com/api.php?amount=10'

    def questions
        self.class.get('&category=10&type=multiple')
    end
end


def books_quiz
books_questions = BooksTrivia.new
prompt = TTY::Prompt.new
output = books_questions.questions
output = output["results"]
output.each do |q|
    puts q["question"]
    answers = q["incorrect_answers"]
    answers << q["correct_answer"]
    answers = answers.shuffle
    user_input = prompt.select("Select your answer:", answers)
    if user_input == q["correct_answer"]
        puts "Yes! You got it"
        puts " "
        puts " "
        next output
    else 
        puts "Oops, that was incorrect"
        puts " "
        puts " "
        next output
    end
end
end