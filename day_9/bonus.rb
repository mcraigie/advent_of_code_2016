data = File.read(ARGV[0])

def decompressed_length?(input)
	if input.length == 0
		0
	elsif input.length == 1
		1
	elsif input[0] != '('
		1 + decompressed_length?(input[1..-1])
	elsif input[0] == '('
		marker = input.match(/\((\d+)x(\d+)\)/)
		section_length = marker[1].to_i
		multiplier = marker[2].to_i

		post_marker_section = input[marker[0].length..-1]
		repeat_section = post_marker_section[0...section_length]
		additional_section = post_marker_section[section_length..-1]

		(decompressed_length?(repeat_section) * multiplier) + decompressed_length?(additional_section)
	end
end

p decompressed_length?(data)