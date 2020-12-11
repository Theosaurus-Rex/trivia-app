require 'httparty'
require "tty-prompt"

class ArtTrivia
    include HTTParty
    base_uri 'opentdb.com/api.php?amount=10'

    #Method to obtain questions from specific category
    def questions
        self.class.get('&category=25&type=multiple')
    end
end

def art_quiz
art_questions = ArtTrivia.new
prompt = TTY::Prompt.new
output = art_questions.questions
output = output["results"]
p output
output.each do |q|
    question = q["question"]
    question = question.gsub("&#039;", "'")
    puts question
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
finish_quiz

end




