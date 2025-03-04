def merge_sort(arr)
  return arr if arr.length <= 1 # Base case: already sorted

  # Split the array into two halves
  mid = arr.length / 2
  left_half = merge_sort(arr[0...mid]) # Recursively sort the left half
  right_half = merge_sort(arr[mid..-1]) # Recursively sort the right half

  # Merge the two sorted halves
  merge(left_half, right_half)
end

# Merge two sorted arrays

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift # Take the first element from left
    else
      sorted << right.shift # Take the first element from right
    end
  end
  sorted + left + right # Concatenate any remaining elements
end

# Test the merge_sort method
arr1 = [3, 2, 1, 13, 8, 5, 0, 1]
puts "Unsorted: #{arr1.inspect}"
puts "Sorted: #{merge_sort(arr1).inspect}"

arr2 = [105, 79, 100, 110]
puts "Unsorted: #{arr2.inspect}"
puts "Sorted: #{merge_sort(arr2).inspect}"
