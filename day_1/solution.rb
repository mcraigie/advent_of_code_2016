instructions = File.read(ARGV[0]).split(", ")

x = y = current_direction = 0

instructions.each do |instruction|
	if instruction[0] == 'R'
		current_direction = (current_direction + 90).modulo(360)
	else
		current_direction = (current_direction - 90).modulo(360)
	end

	delta = instruction[1..-1].to_i

	case current_direction
	when 0
		y += delta
	when 180
		y -= delta
	when 90
		x += delta
	when 270
		x -= delta
	end
end

puts y.abs + x.abs