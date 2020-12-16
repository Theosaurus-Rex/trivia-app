
module Decoder
    def decode
        self.gsub("&uuml;", "ü").gsub("&eacute;", "é").gsub("&#039;", "'").gsub("&ldquo;", "\"").gsub("&quot;", "'").gsub("&rdquo", "”").gsub("&rsquo;", "’").gsub("&ocirc;", "ô").gsub("&amp;", "&").gsub("&ecirc;", "ê").gsub("&ntilde;", "~").gsub("&deg;", "°").gsub("&euml;", "ë").gsub("&oacute;", "ó")
    end
end
