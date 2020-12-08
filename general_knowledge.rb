require 'httparty'
require "tty-prompt"

class GeneralKnowledgeTrivia
    include HTTParty
    base_uri 'opentdb.com/api.php?amount=10'

    def questions
        self.class.get('&category=9&type=multiple')
    end
end
def general_knowledge_quiz
general_knowledge_questions = GeneralKnowledgeTrivia.new
prompt = TTY::Prompt.new
output = general_knowledge_questions.questions
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