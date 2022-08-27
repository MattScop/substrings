=begin 
1. Create a method (string, dictionary)
2. For each dictionary word, scan the string to see whether it is included 
in one of the words in the dictionary array and place it inside a new array.
3. Reduce the new array and return a hash containing a list of the words
=end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# 1.
def substrings(string, dictionary)
    # 2.
    matched_words = []
    dictionary.each do |word|
        if string.downcase.scan(word) == []
            next #skip if it doesn't match any word
        else matched_words << string.downcase.scan(word)
        end
    end
    # 3.
    new_hash = matched_words.flatten.reduce({}) do |total, current|
        if total[current]
            total[current] += 1
        else 
            total[current] = 1
        end
        total
    end
    puts new_hash
end

substrings("Howdy partner, sit down! How's it going?", dictionary)