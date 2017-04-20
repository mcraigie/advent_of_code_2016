require 'digest/md5'

door_id = 'cxdnnyjw'
i = 0
password = ""

loop do
	step = Digest::MD5.hexdigest("#{door_id}#{i}")

	password = "#{password}#{step[5]}" if step[0,5] == ('0' * 5)
	p password if step[0,5] == ('0' * 5)

	break if password.length == 8
	i += 1
end