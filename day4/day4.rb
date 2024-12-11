# frozen_string_literal: true

# NOTE: Part One
file = File.open('4_input')
pattern_forwards = /XMAS/
pattern_backwards = /SAMX/
result = 0
file.each_line do |line|
  matches_forwards = line.scan(pattern_forwards)
  matches_backwards = line.scan(pattern_backwards)
  result += matches_forwards.size + matches_backwards.size
end

file.close
file = File.open('4_input')
lines = file.each_line.map(&:chomp)
columns = lines.map(&:chars).transpose.map(&:join)
columns.each do |line|
  matches_forwards = line.scan(pattern_forwards)
  matches_backwards = line.scan(pattern_backwards)
  result += matches_forwards.size + matches_backwards.size
end

# NOTE: Part Two
# file = File.open('3_input')
# content = file.readlines.join
# active = true
# result = 0
# content.scan(/do\(\)|don't\(\)|mul\(\d+,\d+\)/) do |match|
#   case match
#   when 'do()'
#     active = true
#   when "don't()"
#     active = false
#   else
#     if active
#       str = match.match(pattern)
#       result += str[1].to_i * str[2].to_i
#     end
#   end
# end
# puts result
