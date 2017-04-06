require 'set'

instructions = File.read(ARGV[0]).split(", ")

x = y = current_direction = 0
history = Set.new ["0,0"]

instructions.each do |instruction|
	if instruction[0] == 'R'
		current_direction = (current_direction + 90).modulo(360)
	else
		current_direction = (current_direction - 90).modulo(360)
	end

	delta = instruction[1..-1].to_i

	loop do
		case current_direction
		when 0
			y += 1
		when 180
			y -= 1
		when 90
			x += 1
		when 270
			x -= 1
		end
		
		point = "#{x},#{y}"
		puts point
		
		if history.include?(point)
			puts y.abs + x.abs
			exit
		else
			history.add(point)
		end

		delta -= 1
		break if delta == 0
	end
end