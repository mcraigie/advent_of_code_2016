require 'digest/md5'

door_id = ARGV[0]
i = 0
password = [nil] * 8

loop do
	h = Digest::MD5.hexdigest("#{door_id}#{i}")
	if h[0,5] == ('00000') and h[5].to_i.to_s == h[5] and password[h[5].to_i] == nil 
		password[h[5].to_i] = h[6]
		password = password.first(8)
		p password
	end

	break if !password.any?{ |e| e.nil? }
	i += 1
end

p password.join