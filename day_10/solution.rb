class Bot
	@@all_bots = Hash.new

	def self.all_bots()
		@@all_bots
	end

	def initialize(low_dest, high_dest)
		@low_dest = low_dest
		@high_dest = high_dest
		@values = []
	end

	def give(value)
		@values.push(value)
		if @values.length == 2
			@high_val = @values.max
			@low_val = @values.min
			@values = []

			[[@low_dest, @low_val], [@high_dest, @high_val]].each do |d, v|
				@@all_bots[d].give(v) if d[0...3] == 'bot'
			end
		end
	end

	def describe()
		"(#{@low_val},#{@high_val})"
	end
end

File.read(ARGV[0]).split("\n").sort.each do |line|
	if line[0] == 'b'
		source_bot, low_dest, high_dest = line.scan(/(bot \d+|output \d+)/).flatten
		Bot.all_bots[source_bot] = Bot.new(low_dest, high_dest)
	else
		value, dest_bot = line.scan(/(bot \d+|\d+)/).flatten
		Bot.all_bots[dest_bot].give(value.to_i)
	end
end

p Bot.all_bots.map { |k, v| "#{k}: #{v.describe}" }.grep (/17,61/)