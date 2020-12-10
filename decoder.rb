module Decoder
    def decode
        #Apostrophe
        self.gsub("&#039;", "'")
    end
end