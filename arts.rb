require 'httparty'
require "tty-prompt"

class ArtTrivia
    include HTTParty
    base_uri 'opentdb.com/api.php?amount=10'

    def questions
        self.class.get('&category=25&type=multiple')
    end
end

art_questions = ArtTrivia.new
prompt = TTY::Prompt.new
output = art_questions.questions
output = output["results"]
output.each do |q|
    puts q["question"]
    answers = q["incorrect_answers"]
    answers << q["correct_answer"]
    answers = answers.shuffle
    user_input = prompt.select("Select your answer:", answers)
    if user_input == q["correct_answer"]
        puts "Yes! You got it"
        next output
    else 
        puts "Oops, that was incorrect"
        next output
    end
end
    


