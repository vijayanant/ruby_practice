class String
  def to_camel_case
    res = ""
    self.scan(/[\w']+/).each { |word| res += word.capitalize! + " "}
    res.rstrip
  end
  str = "how can mirrors be real if our eyes aren't real";
  puts "'" + str.to_camel_case + "'"
end 
