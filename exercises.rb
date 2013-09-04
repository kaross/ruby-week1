arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts "=> 1."
arr.each do |element|
	puts element
end

puts
puts "=> 2."
arr.each do |element|
	puts element if element > 5
end

puts
puts "=> 3."
odd_arr = arr.select{|element| element.odd?}
puts odd_arr

puts
puts "=> 4."
arr << 11
arr.unshift(0)
puts arr

puts
puts "=> 5."
arr.pop
arr << 3
puts arr

puts
puts "=> 6."
arr.uniq!
puts arr

# => 7.
# An array is an ordered collection of elements indexed by integers.  
# A hash is a collection of key/value pairs.  Order is not guaranteed and the keys and values can be any object.

puts
puts "=> 8."
hash_1_8 = {:a=>1, :b=>2}
puts hash_1_8
# hash_1_9 = {a:1, b:2}
# puts hash_1_9

puts
puts "=> 9."
hash = {:a=>1, :b=>2, :c=>3, :d=>4}
puts hash[:b]

puts
puts "=> 10."
hash[:e] = 5
puts hash[:e]

puts
puts "=> 13."
hash.keep_if {|k, v| v >= 3.5}
puts hash.to_s

puts "=> 14."
#Yes, it can:
hash[:f] = [1, 2, 3]
arr << hash
puts arr

# => 15.
# So far, actually Array is my favorite.  It is kind of elegant in that it provides a lot of useful features 
# that can be annoying to do in other languages.