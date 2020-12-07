require 'httparty'

class ArtTrivia
    include HTTParty
    base_uri 'opentdb.com/api.php?amount=10'

    def questions
        self.class.get('&category=25&type=multiple')
    end
end

art_questions = ArtTrivia.new
output = art_questions.questions
output = output["results"]
output.each do |q|
    puts q["question"]
end
