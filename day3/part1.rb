i = IO.read("input").strip.chars

map = { "0:0" => 1 } # starting point
x = 0
y = 0
i.each do |d|
  case d
  when "^" then y += 1
  when "v" then y -= 1
  when ">" then x += 1
  when "<" then x -= 1
  end
  k = "#{x}:#{y}"
  map[k] = (map[k] || 0) + 1
end

puts "#{map.count} houses got presents!"

