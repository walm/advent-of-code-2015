i = IO.read("input").split("\n")
# test words
# i = ["qjhvhtzxzqqqjhvhtzxzqqjkmpb", "xxyxx", "uurcxstgmygtbstg", "ieodomkazucvgmuy"]
# also test with this, for the or part in first regexp
# i = ["xyxy"]
nice = []
i.each do |word|
  if word.scan(/([a-z][a-z]).+\1|([a-z][a-z])+\2/).count >= 1 &&
    word =~ /([a-z]).\1/i
    nice << word
  end
end

puts "#{nice.count} nice words"
