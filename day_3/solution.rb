triangle_count = 0

lines = File.read(ARGV[0]).split("\n")

lines.each do |line|
	side_lengths = line.gsub(/\s+/, ' ').strip.split(' ').map(&:to_i)
	
	triangle_invalid = true unless side_lengths[0] + side_lengths[1] > side_lengths[2]
	triangle_invalid = true unless side_lengths[1] + side_lengths[2] > side_lengths[0]
	triangle_invalid = true unless side_lengths[2] + side_lengths[0] > side_lengths[1]

	triangle_count += 1 unless triangle_invalid
end

puts triangle_count