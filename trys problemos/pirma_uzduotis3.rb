# https://rubymonk.com/learning/books/1-ruby-primer/problems/5-string-length-finder
# Find the length of strings in an array
def length_finder(input_array)
  arr = []
  for i in 0...input_array.length
    arr << input_array[i].length
  end
  arr
end
puts length_finder(['Ruby','Rails','C42'])