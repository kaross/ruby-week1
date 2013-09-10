def english_number_big(number)
	if number < 0 
		return "Please enter a number that isn't negative."
	end

	if number == 0 
		return "zero"
	end

	num_string = ''

	zillions = [['billion',	9],
							['million',	6], 
							['thousand', 3]]
	
	left = number

	# I decided not to use recursion here because it would be kind of inefficient to have to iterate through
	# the divisions and modulos to return zero for all of the zillions on each pass.
	if number >= 1000
		zillions.each do |zillion| 							
			z_num = 10 ** zillion[1]
			z_word = zillion[0]

			write = left / z_num
			left = left % z_num

			if write > 0  
				zills = english_number_small(write)
				num_string += zills + ' ' + z_word
				if left > 0
					num_string += ' '
				end
			end
		end
	end

	if left > 0
		num_string += english_number_small(left).to_s
	end

	num_string
end

def english_number_small(number)
	# since this is called from within english_number_big we can assume that the input is > 0
	num_string = ''

	ones_place = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
	tens_place = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
	teenagers = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

	left = number
	write = left / 100
	left = left % 100

	if write > 0
		num_string += ones_place[write-1] + ' hundred'
		if left > 0
			num_string += ' '
		end
	end

	write = left / 10
	left = left % 10

	if write > 0
		if (write == 1) && (left > 0)
			num_string += teenagers[left-1]
			left = 0
		else
			num_string += tens_place[write-1]
		end

		if left > 0
			num_string += ' '
		end
	end

	if left > 0
		num_string += ones_place[left-1]
	end

	num_string
end

# puts "Please enter a positive integer"
# input = gets.chomp.to_i

# puts english_number_big(input)

bottles = 5
while bottles > 2
	bottles_english = english_number_big(bottles)
	puts bottles_english.capitalize + ' bottles of beer on the wall, ' + bottles_english + ' bottles of beer!' 
	bottles = bottles - 1
	puts 'Take one down, pass it around, ' + bottles_english + ' bottles of beer on the wall!'
end

puts 'Two bottles of beer on the wall, two bottles of beer!' 
puts 'Take one down, pass it around, one bottle of beer on the wall!'
puts 'One bottle of beer on the wall, one bottle of beer!' 
puts 'Take one down, pass it around, no more bottles of beer on the wall!'

