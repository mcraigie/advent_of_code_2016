class Cursor
	def initialize(keypad_map, starting_x, starting_y)
		@keypad_map = keypad_map
		@x = starting_x
		@y = starting_y
	end

	def move(instruction)
		new_x = @x
		new_y = @y

		case instruction
		when "U"
			new_y = @y - 1
		when "D"
			new_y = @y + 1
		when "L"
			new_x = @x - 1
		when "R"
			new_x = @x + 1
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
[[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, '1', nil, nil, nil],
[nil, nil, '2', '3', '4', nil, nil],
[nil, '5', '6', '7', '8', '9', nil],
[nil, nil, 'A', 'B', 'C', nil, nil],
[nil, nil, nil, 'D', nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil]]

starting_x = 1
starting_y = 3

cursor = Cursor.new(keypad_map, starting_x, starting_y)

lines = File.read(ARGV[0]).split("\n")

lines.each do |digit|
	digit.each_char do |step|
		cursor.move(step)
	end
	puts cursor.current_value
end