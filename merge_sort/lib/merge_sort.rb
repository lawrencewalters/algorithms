require "benchmark"
require 'pp'
class MergeSort
	def self.sort(items)
		if items.length == 1 
			return items, 0
		end
		
	  # cut in half if greater than x size?
		left, right = items.each_slice((items.size / 2.0).round).to_a
    split_inversions = 0

		if items.length > 2
	    left, left_inversions = sort(left)
			right, right_inversions = sort(right)
      split_inversions = left_inversions + right_inversions
		end

		new_array = []
		lefty = 0
		righty = 0
		(items.length).times do |k|
			if righty >= right.length || (left[lefty] && left[lefty] < right[righty])
				new_array += [left[lefty]]
				lefty = lefty + 1
			else
				new_array += [right[righty]]
        split_inversions = split_inversions + (left.length - lefty)
        righty = righty + 1
			end
    end
    #pp items, split_inversions, new_array
		return new_array, split_inversions
	end
end

# read the array
#items = IO.read("IntegerArray2.txt").split("\n")
items = []
f = File.open("IntegerArray.txt")
while !f.eof? do
  items.push(f.readline.strip.to_i)
end
#pp items
puts(Benchmark.measure { items, split_inversions = MergeSort.sort(items); puts split_inversions })

# pp MergeSort.sort([5,4,1,8,7,2,6,3])
# pp MergeSort.sort([5,4,1,8,7,2,6, 6])
# pp MergeSort.sort([5,4,1,8,7,2,6])
# pp MergeSort.sort([5,4,1,8,7,2,66,66])
