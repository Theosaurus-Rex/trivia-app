module Decoder
    def decode
        self.gsub("&uuml;", "ü").gsub("&eacute;", "é").gsub("&#039;", "'").gsub("&ldquo;", "\"").gsub("&quot;", "'").gsub("&rdquo", "”").gsub("&rsquo;", "’")
       

       
    end
end