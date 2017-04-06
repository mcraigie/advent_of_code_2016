class Cursor
	def initialize(keypad_map, starting_x, starting_y)
		@keypad_map = keypad_map
		@x = starting_x
		@y = starting_y
	end

	def move(instruction)
		case instruction
		when "U"
			new_x = @x
			new_y = @y - 1
		when "D"
			new_x = @x
			new_y = @y + 1
		when "L"
			new_x = @x - 1
			new_y = @y
		when "R"
			new_x = @x + 1
			new_y = @y
		end

		if @keypad_map[new_y][new_x]
			@x = new_x
			@y = new_y
		end
	end

	def current_value
		@keypad_map[@y][@x]
	end
end

keypad_map = \
[[nil, nil, nil, nil, nil],
[nil, '1', '2', '3', nil],
[nil, '4', '5', '6', nil],
[nil, '7', '8', '9', nil],
[nil, nil, nil, nil, nil]]

starting_x = 2
starting_y = 2

cursor = Cursor.new(keypad_map, starting_x, starting_y)

lines = File.read(ARGV[0]).split("\n")

lines.each do |digit|
	digit.each_char do |step|
		cursor.move(step)
	end
	puts cursor.current_value
end