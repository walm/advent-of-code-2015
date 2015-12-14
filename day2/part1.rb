i = IO.read("input").split "\n" # format: l*w*h
total = 0
i.each do |row|
  l, w, h = row.split("x").map(&:to_i)
  t = 2*l*w + 2*w*h + 2*h*l
  e = [l, w, h].sort.first(2).inject(:*)
  total += t + e
end

puts "Make order of #{total} square feet"

