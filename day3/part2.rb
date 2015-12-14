i = IO.read("input").strip.chars

map = { "0:0" => 2 }
sx, rx = 0, 0
sy, ry = 0, 0
i.each_with_index do |d, idx|
  x, y = sx, sy if idx.odd?
  x, y = rx, ry unless idx.odd?

  case d
  when "^" then y += 1
  when "v" then y -= 1
  when ">" then x += 1
  when "<" then x -= 1
  end
  k = "#{x}:#{y}"
  map[k] = (map[k] || 0) + 1

  sx, sy = x, y if idx.odd?
  rx, ry = x, y unless idx.odd?
end

puts "#{map.count} houses got presents!"

