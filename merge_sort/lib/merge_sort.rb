require 'pp'
class MergeSort
	def self.sort(items)
		if items.length == 1 
			return items
		end
		
	  # cut in half if greater than x size?
		left, right = items.each_slice((items.size / 2.0).round).to_a

		if items.length > 2
	    left = sort(left)
			right = sort(right)
		end

		new_array = []
		lefty = 0
		righty = 0
#		puts "items" + items.length.to_s
		(items.length).times do |k|
#			puts "#{k}  #{left[lefty]} #{right[righty]}"
			if righty >= right.length || (left[lefty] && left[lefty] < right[righty])
				new_array += [left[lefty]]
				lefty = lefty + 1
			else
				new_array += [right[righty]]
				righty = righty + 1
			end
		end
#		pp new_array
		new_array
	end
end

pp MergeSort.sort([5,4,1,8,7,2,6,3])
pp MergeSort.sort([5,4,1,8,7,2,6, 6])
pp MergeSort.sort([5,4,1,8,7,2,6])
pp MergeSort.sort([5,4,1,8,7,2,66,66])
