i = IO.read("input").split("\n")
nice = []
i.each do |word|
  if word !~ /ab|cd|pq|xy/ &&
     word =~ /([a-z])\1/i &&
     word.scan(/[aeiou]/).count >= 3
    nice << word
  end
end

puts "#{nice.count} nice words"
