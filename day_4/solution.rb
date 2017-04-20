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

input = File.read(ARGV[0]).split("\n")
sector_sum = 0

input.each do |line|
	components = /(?<room>.*)-(?<sector>\d+)\[(?<checksum>.*)\]/.match(line)

	sector_sum += components[:sector].to_i if generate_checksum(components[:room]) == components[:checksum]
end

p sector_sum