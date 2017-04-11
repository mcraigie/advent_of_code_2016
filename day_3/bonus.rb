def valid_triangle?(side_lengths)
	triangle_invalid = true unless side_lengths[0] + side_lengths[1] > side_lengths[2]
	triangle_invalid = true unless side_lengths[1] + side_lengths[2] > side_lengths[0]
	triangle_invalid = true unless side_lengths[2] + side_lengths[0] > side_lengths[1]
	true unless triangle_invalid
end

input = File.read(ARGV[0]).split("\n")
rows = input.map{ |row| row.split.map(&:to_i)}
rows = rows.transpose

triangle_count = 0

rows.each do |row|
	row.each_slice(3) do |triangle|
		triangle_count += 1 if valid_triangle?(triangle)
	end
end

puts triangle_count
