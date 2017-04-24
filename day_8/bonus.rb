class Screen
	def initialize(width, height)
		@state = Array.new(height) { |e| Array.new(width) { |e| 0 }}
	end

	def render()
		p '-' * ((@state[0].length * 2) - 1)
		@state.each do |row|
			p row.map {|element| "#{element == 1 ? '#' : '.'} "}.join.strip
		end
	end

	def rect(width, height)
		(0...height).map{ |y| (0...width).map{ |x| @state[y][x] = 1}}
	end

	def rotate_row(row_number, rotation_count)
		@state[row_number].rotate!(-1 * rotation_count)
	end

	def rotate_column(column_number, column_count)
		@state = @state.transpose
		rotate_row(column_number, column_count)
		@state = @state.transpose
	end
end


screen = Screen.new(50, 6)

File.read(ARGV[0]).split("\n").each do |instruction|
	split = instruction.gsub(/[x,x=,y=,by]/, ' ').split(/\s+/)

	if split.first == 'rect'
		screen.rect(split[1].to_i,split[2].to_i)
	elsif split[1] == 'row'
		screen.rotate_row(split[2].to_i, split[3].to_i)
	elsif split[1] == 'column'
		screen.rotate_column(split[2].to_i, split[3].to_i)
	end
end

screen.render