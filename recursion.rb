def my_shuffle(arr)
	recursive_shuffle(arr, [])
end

def recursive_shuffle(unshuffled, shuffled)
	if unshuffled.empty?
		return shuffled
	else
		shuffled << unshuffled.slice!(rand(unshuffled.size))
		recursive_shuffle(unshuffled, shuffled)
	end
end

def dictionary_sort(arr)
	recursive_dic_sort(arr, [])
end

def recursive_dic_sort(unsorted, sorted)
	if unsorted.empty?
		return sorted
	else
		sorted << unsorted.slice!(arr_min(unsorted))
		recursive_dic_sort(unsorted, sorted)
	end
end

def arr_min(arr)
	min = arr[0]
	min_idx = 0
	arr.each_index do |idx|
		if arr[idx].downcase < min.downcase
			min = arr[idx]
			min_idx = idx
		end
	end

	min_idx
end

class Array
	def shuffle
		my_shuffle(self)
	end
end

# Call shuffle
orig_arr = ['B', 'b', 'C', 'c', 'd', 'D']
# shuffled_arr = my_shuffle(orig_arr)
# puts shuffled_arr.to_s
puts orig_arr.shuffle.to_s

# Call Dictionary Sort
sorted_arr = dictionary_sort(shuffled_arr)
puts sorted_arr.to_s
