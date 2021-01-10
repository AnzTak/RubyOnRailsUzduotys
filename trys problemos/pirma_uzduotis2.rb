# https://rubymonk.com/learning/books/1-ruby-primer/problems/15-select-random-elements-from-an-array
# Select random elements from an array
def random_select(array, n)
	arr = Array.new
	n.times do
		iarr = rand(array.length)
		arr << array[iarr]
	end	
	arr
end
puts random_select([1,2,3,4,5], 2)