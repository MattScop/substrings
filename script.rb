=begin 
1. Create a method (string, dictionary)
2. For each dictionary word, scan the string to see whether it is included 
in one of the words in the dictionary array and place it inside a new array.
3. Reduce the new array and return a hash containing a list of the words

4. ADDITIONAL STEP: Make it so that the user inserts the string
=end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# 1.
def substrings(dictionary)
    # 4.
    puts "Type a Phrase, I will return a Hash"
    string = gets.chomp
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
    if new_hash == {} then puts "Sorry, your phrase did not match any word in the dictionary, try again!"; substrings(dictionary)
    else puts new_hash
    end
end

substrings(dictionary)