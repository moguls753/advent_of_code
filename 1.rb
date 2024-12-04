# frozen_string_literal: true

# NOTE: Part One
file = File.open('1_input')
array1 = []
array2 = []
file.each_line do |line|
  a, b = line.split
  array1 << a.to_i
  array2 << b.to_i
end
array1.sort!
array2.sort!
result = 0
array1.each_with_index do |elem, index|
  result += (elem.to_i - array2[index].to_i).abs
end
puts result

# NOTE: Part Two
similarity_score = 0
array1.each do |id|
  similarity_score += id * array2.select { |elem| elem == id }.count
end
puts similarity_score
