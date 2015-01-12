def ho(ho=nil) 
  ho ? "Ho " + ho : "Ho!"
end 

puts ho()
puts ho(ho())
puts ho(ho(ho()))
