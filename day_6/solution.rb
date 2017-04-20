message = ""
File.read(ARGV[0]).split("\n").map(&:chars).transpose.each do |character_column|
	message = "#{message}#{character_column.max_by { |i| character_column.count(i) }}"
end
p message