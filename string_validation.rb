def validation string
  string = string.to_s.strip
  string == string.to_i.to_s || string.empty? && string.length < 9 ? string.to_i + + 1 : "invalid"
end

puts validation 12
puts validation "12"
puts validation "12 "
puts validation " 12 "
puts validation "     12     "
puts validation "a12 "
puts validation " "
puts validation "a"
