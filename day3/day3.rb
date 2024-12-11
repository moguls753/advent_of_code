# frozen_string_literal: true

# NOTE: Part One
file = File.open('3_input')
pattern = /mul\((\d+),(\d+)\)/
result = 0
file.each_line do |line|
  matches = line.scan(pattern)
  matches.each do |match|
    result += match[0].to_i * match[1].to_i
  end
end
puts result

# NOTE: Part Two
file = File.open('3_input')
content = file.readlines.join
active = true
result = 0
content.scan(/do\(\)|don't\(\)|mul\(\d+,\d+\)/) do |match|
  case match
  when 'do()'
    active = true
  when "don't()"
    active = false
  else
    if active
      str = match.match(pattern)
      result += str[1].to_i * str[2].to_i
    end
  end
end
puts result
