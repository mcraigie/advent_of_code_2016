def valid_triangle?(side_lengths)
	triangle_invalid = true unless side_lengths[0] + side_lengths[1] > side_lengths[2]
	triangle_invalid = true unless side_lengths[1] + side_lengths[2] > side_lengths[0]
	triangle_invalid = true unless side_lengths[2] + side_lengths[0] > side_lengths[1]
	true unless triangle_invalid
end

def clean(line)
	line.gsub(/\s+/, ' ').strip.split(' ').map(&:to_i)
end

triangle_count = 0

lines = File.read(ARGV[0]).split("\n")

lines.each_slice(3) do |batch|
	sides_a = clean(batch[0])
	sides_b = clean(batch[1])
	sides_c = clean(batch[2])

	i = 0
	loop do
		triangle_count += 1 if valid_triangle?([sides_a[i], sides_b[i], sides_c[i]])
		break if (i += 1) == 3
	end
end

puts triangle_count