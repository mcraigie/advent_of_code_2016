instructions = File.read(ARGV[0]).split(", ")

x_dist = y_dist = current_direction = 0

instructions.each do |instruction|
	if instruction[0] == 'R'
		current_direction = (current_direction + 90).modulo(360)
	else
		current_direction = (current_direction - 90).modulo(360)
	end

	delta = instruction[1..-1].to_i

	case current_direction
	when 0
		y_dist += delta
	when 180
		y_dist -= delta
	when 90
		x_dist += delta
	when 270
		x_dist -= delta
	end
end

puts final_distance = y_dist.abs + x_dist.abs