def generate_checksum(room_name)
	room_name.tr!('-', '')
	tally = Hash.new

	room_name.each_char do |char|
		if tally[char]
			tally[char] += 1
		else
			tally[char] = 1
		end
	end

	tally.sort_by {|k, v| [-v, k]}.first(5).map(&:first).join
end

# this script handles uppercase letters as well (the challenge only requires lowercase)
def rotate_char(character_ord, rotation_budget)
	if rotation_budget > 0
		if character_ord.between?('A'.ord, 'Y'.ord) or character_ord.between?('a'.ord, 'y'.ord)
			return rotate_char(character_ord + 1, rotation_budget - 1)
		elsif ['Z'.ord,'z'.ord].member?(character_ord)
			return rotate_char(character_ord - 25, rotation_budget - 1)
		end
	end
	character_ord.chr == '-' ? ' ' : character_ord.chr
end


File.read(ARGV[0]).split("\n").each do |line|
	components = /(?<room>.*)-(?<sector>\d+)\[(?<checksum>.*)\]/.match(line)
	if generate_checksum(components[:room]) == components[:checksum]
		puts "Room: #{components[:room].chars.map {|c| rotate_char(c.ord, components[:sector].to_i)}.join}, Sector: #{components[:sector]}"
	end
end

# simply grep the deciphered output for 'north' to find the answer