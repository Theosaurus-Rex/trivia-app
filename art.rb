require 'httparty'
require "tty-prompt"
require "tty-spinner"
require "./decoder"
require "./player-class"
require "tty-font"


class ArtTrivia
    include HTTParty
    base_uri 'opentdb.com/api.php?amount=10'

    #Method to obtain questions from specific category
    def questions
        self.class.get('&category=25&type=multiple')
    end
end

def art_quiz
    include Decoder
    spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :pulse_2)
    spinner.auto_spin
    pastel = Pastel.new
    $category = "Art Trivia"
    art_questions = ArtTrivia.new
    prompt = TTY::Prompt.new
    output = art_questions.questions
    output = output["results"]
    spinner.stop("Done!")
    font = TTY::Font.new(:straight)
    puts font.write("ART")
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
        next output
    else 
        puts "Oops, that was incorrect"
        puts " "
        puts " "
        next output
    end
end

    finish_quiz
end





