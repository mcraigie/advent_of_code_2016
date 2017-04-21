def odds(segments)
	segments.select.with_index{|_,i| (i+1) % 2 == 1}
end

def evens(segments)
	segments.select.with_index{|_,i| (i+1) % 2 == 0}
end

def segment(address)
	segments = address.split(/[\[\]]/)
	{:hypernet_sequences=>evens(segments), :other_sequences=>odds(segments)}
end

def abba?(sub_string)
	sub_string[0] == sub_string[3] and sub_string[1] == sub_string[2] and sub_string[0] != sub_string[1]
end

def contains_abba?(segment)
	segment.chars.each_cons(4).map(&:join).any? {|quad| abba?(quad)}
end

segmented_addresses = File.read(ARGV[0]).split("\n").map{|l| segment(l)} 
p segmented_addresses.count {|address| !address[:hypernet_sequences].any? {|h| contains_abba?(h)} and address[:other_sequences].any? {|h| contains_abba?(h)}}