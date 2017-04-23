def odds(segments)
	segments.select.with_index{|e,i| (i+1) % 2 == 1}
end

def evens(segments)
	segments.select.with_index{|e,i| (i+1) % 2 == 0}
end

def segment(address)
	segments = address.split(/[\[\]]/)
	{:hypernet_sequences=>evens(segments), :supernet_sequences=>odds(segments)} # none of my input addresses start with a hypernet sequence
end

def is_aba?(sub_string)
	sub_string[0] == sub_string[2] and sub_string[0] != sub_string[1]
end

def list_aba(segments)
	segments.map {|s| s.chars.each_cons(3).map(&:join).reject {|t| not is_aba?(t)}}.flatten.uniq
end

def complement(aba)
	[aba[1],aba[0],aba[1]].join
end

def contains_complement(a, b)
	(a & b.map {|i| complement(i)}).length > 0
end

segmented_addresses = File.read(ARGV[0]).split("\n").map{|l| segment(l)}

p segmented_addresses.count {|address| contains_complement(list_aba(address[:hypernet_sequences]), list_aba(address[:supernet_sequences]))}

