i = IO.read("input")
floor = 0
pos = 0
i.chars.each_with_index do |d, idx|
  floor += (d == "(" ? 1 : -1)
  pos = idx + 1
  break if floor == -1
end
puts "Santa hit basement at #{pos}"

