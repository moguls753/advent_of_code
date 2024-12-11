# frozen_string_literal: true

# NOTE: Part One
file = File.open('2_input')
safe_reports = 0
file.each_line do |line|
  line_array = line.split.map(&:to_i)
  decreasing = (line_array[0] - line_array[1]).positive?
  line_array.each_with_index do |ele, index|
    if index == line_array.size - 1
      safe_reports += 1
      break
    end
    break if (ele - line_array[index + 1]).zero? || (ele - line_array[index + 1]).abs > 3
    next if (ele - line_array[index + 1]).positive? && decreasing
    next if (ele - line_array[index + 1]).negative? && !decreasing

    break
  end
end
puts safe_reports

# NOTE: Part Two
file = File.open('2_input')
safe_reports = 0

file.each_line do |line|
  line_array = line.split.map(&:to_i)

  # Prüfen, ob der Bericht ohne Änderungen sicher ist
  def safe?(levels)
    # Bestimme die Richtung (ob die Werte abnehmen oder zunehmen)
    direction = nil
    levels.each_with_index do |ele, index|
      next if index == levels.size - 1

      diff = levels[index + 1] - ele

      # Wenn der Unterschied null ist oder zu groß, ist es unsicher
      return false if diff == 0 || diff.abs > 3

      # Bestimme die Richtung, die die Liste nehmen sollte (nur eine Richtung ist erlaubt)
      if direction.nil?
        direction = diff
      elsif (diff.positive? && direction.positive?) || (diff.negative? && direction.negative?)
        # Fortsetzen in der gleichen Richtung
      else
        return false # Wenn es eine Änderung der Richtung gibt, ist es unsicher
      end
    end
    true
  end

  # Prüfe zuerst, ob der Bericht ohne Änderungen sicher ist
  if safe?(line_array)
    safe_reports += 1
  else
    # Wenn der Bericht unsicher ist, versuche, jedes Level zu entfernen und prüfe, ob die Liste sicher wird
    (0...line_array.size).each do |i|
      modified_line = line_array[0...i] + line_array[i + 1..-1]
      if safe?(modified_line)
        safe_reports += 1
        break
      end
    end
  end
end

puts safe_reports
