require 'digest/md5'

key = IO.read("input").strip

dig = 0
while true
  dig += 1
  md5 = Digest::MD5.hexdigest("#{key}#{dig}")
  if md5[0...5] == "00000"
    break
  end
end
puts dig

