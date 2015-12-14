require 'digest/md5'

key = IO.read("input").strip

dig = 254575
while true
  dig += 1
  md5 = Digest::MD5.hexdigest("#{key}#{dig}")
  if md5[0...6] == "000000"
    break
  end
end
puts dig

