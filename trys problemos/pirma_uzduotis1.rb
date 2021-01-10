# https://rubymonk.com/learning/books/1-ruby-primer/problems/6-frequency-finder
# Find the frequency of a string in a sentence
def find_frequency(sentence, word)
	words = sentence.split(/[ ,.]/)
	wcount = 0
	for iword in words
		if iword.downcase == word.downcase
			wcount += 1
		end
	end
	wcount
end
sentence = 'English texts for beginners to practice reading and comprehension online and for free. Practicing your comprehension of written English will both improve your vocabulary and understanding of grammar and word order. The texts below are designed to help you develop while giving you an instant evaluation of your progress.'
word = 'and'
puts find_frequency(sentence, word)