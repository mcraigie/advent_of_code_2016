data = File.read(ARGV[0])

i = decompressed_length = 0

loop do
	if data[i] == '('
		marker = data[i..i+10].match(/\((\d+)x(\d+)\)/)
		section_length = marker[1].to_i
		multiplier = marker[2].to_i

		decompressed_length += section_length * multiplier
		i += section_length + marker[0].length
	else
		decompressed_length += 1
		i += 1
	end

	break if i >= data.length
end

p decompressed_length