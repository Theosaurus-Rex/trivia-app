require 'httparty'
require "tty-prompt"
require "./decoder"
require "./player-class"


class BooksTrivia
    include HTTParty
    base_uri 'opentdb.com/api.php?amount=10'

    #Method to obtain questions from specific category
    def questions
        self.class.get('&category=10&type=multiple')
    end
end

def books_quiz
    include Decoder
    pastel = Pastel.new
    $category = "Books"
    books_questions = BooksTrivia.new
    prompt = TTY::Prompt.new
    output = books_questions.questions
    output = output["results"]
    output.each do |q|
        question = q["question"]
        question = question.decode
        puts pastel.magenta(question)
        answers = q["incorrect_answers"]
        answers << q["correct_answer"]
        answers = answers.map{|a| a.decode}
            answers = answers.shuffle
        user_input = prompt.select("Select your answer:", answers)
    if user_input == q["correct_answer"]
        $player.score += 1
        puts "Yes! You got it"
        puts " "
        puts " "
        system("clear")
        next output
    else 
        puts "Oops, that was incorrect"
        puts " "
        puts " "
        system("clear")
        next output
    end
end

    finish_quiz
end