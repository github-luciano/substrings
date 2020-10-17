dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
HASH = {}

def substrings(phrase, dictionary) 
    matches = dictionary.map do |n|
      if "#{phrase}".downcase.include?("#{n}")
        HASH.merge!("#{n}" => HASH["#{n}"].to_i + ("#{phrase}".downcase.scan("#{n}")).count)
      end
    end
    matches.compact!
    matches.uniq!
    p matches
    HASH.clear
end

substrings("below", dictionary)
#=> { "below" => 1, "low" => 1 }
substrings("Howdy partner, sit down! How's it going?", dictionary)
#=> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }