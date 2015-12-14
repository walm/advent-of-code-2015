i = IO.read("input").split "\n" # format: l*w*h
total = 0
i.each do |row|
  l, w, h = row.split("x").map(&:to_i)
  t = [l, w, h].sort.first(2).inject { |s, v| s*2 + v*2 }
  e = l*w*h
  total += t + e
end

puts "Make order of #{total} feet ribbon"
