# Recursion
# Fibonacci and Merge Sort Methods

This repository contains two methods implemented in Ruby:
1. **Fibonacci Sequence Generator**: Generates the Fibonacci sequence using both iterative and recursive approaches.
2. **Merge Sort**: Sorts an array using the recursive merge sort algorithm.

---

## Fibonacci Sequence Generator

### Methods

#### 1. `#fibs` (Iterative Approach)
Generates the Fibonacci sequence using iteration.

```ruby
def fibs(num)
  return [] if num <= 0
  return [0] if num == 1

  sequence = [0, 1]
  (2...num).each do |i|
    sequence << sequence[i - 1] + sequence[i - 2]
  end
  sequence[0...num]
end
```

##### Parameters:
- `num` (Integer): The number of Fibonacci numbers to generate.

##### Returns:
- An array containing the first `num` Fibonacci numbers.

##### Example:
```ruby
puts fibs(8).inspect
# => [0, 1, 1, 2, 3, 5, 8, 13]
```

---

#### 2. `#fibs_rec` (Recursive Approach)
Generates the Fibonacci sequence using recursion.

```ruby
def fibs_rec(num, sequence = [0, 1])
  return [] if num <= 0
  return [0] if num == 1
  return sequence[0...num] if sequence.length >= num

  sequence << sequence[-1] + sequence[-2]
  fibs_rec(num, sequence)
end
```

##### Parameters:
- `num` (Integer): The number of Fibonacci numbers to generate.
- `sequence` (Array, optional): Used internally for recursion. Defaults to `[0, 1]`.

##### Returns:
- An array containing the first `num` Fibonacci numbers.

##### Example:
```ruby
puts fibs_rec(8).inspect
# => [0, 1, 1, 2, 3, 5, 8, 13]
```

---

### Comparison of Iterative vs. Recursive Fibonacci

| Feature               | Iterative (`#fibs`)               | Recursive (`#fibs_rec`)           |
|-----------------------|------------------------------------|-----------------------------------|
| **Readability**        | Simple and straightforward        | Elegant but slightly harder to follow |
| **Performance**        | Faster, no function call overhead | Slower due to recursion overhead  |
| **Stack Overflow Risk**| No                                | Yes (for very large `num`)        |
| **Memory Usage**       | Lower (no call stack overhead)    | Higher (call stack grows)         |
| **Use Case**           | Better for large inputs           | Better for small inputs or elegance |

---

## Merge Sort

### Method

#### `#merge_sort` (Recursive Merge Sort)
Sorts an array using the recursive merge sort algorithm.

```ruby
def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left_half = merge_sort(arr[0...mid])
  right_half = merge_sort(arr[mid..-1])

  merge(left_half, right_half)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end
```

##### Parameters:
- `arr` (Array): The array to be sorted.

##### Returns:
- A new array containing the sorted elements.

##### Example:
```ruby
puts merge_sort([38, 27, 43, 3, 9, 82, 10]).inspect
# => [3, 9, 10, 27, 38, 43, 82]
```

---

### How Merge Sort Works
1. **Divide**:
   - Split the array into two halves.
2. **Conquer**:
   - Recursively sort each half.
3. **Combine**:
   - Merge the two sorted halves into a single sorted array.

---

### Key Features of Merge Sort
- **Time Complexity**: O(n log n) in all cases (best, average, and worst).
- **Space Complexity**: O(n) due to the additional arrays used during merging.
- **Stability**: Merge sort is a stable sorting algorithm, meaning it preserves the relative order of equal elements.

---

### Comparison of Merge Sort with Other Algorithms

| Feature               | Merge Sort                        | Quick Sort                        | Bubble Sort                       |
|-----------------------|------------------------------------|-----------------------------------|-----------------------------------|
| **Time Complexity**    | O(n log n)                        | O(n log n) (average), O(n²) (worst)| O(n²)                            |
| **Space Complexity**   | O(n)                              | O(log n)                          | O(1)                             |
| **Stability**          | Yes                               | No                                | Yes                               |
| **Use Case**           | Large datasets, stable sorting    | General-purpose, in-place sorting | Small datasets, simplicity        |

---

## How to Use

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Run the Ruby code in your terminal or IRB:
   ```bash
   ruby <filename>.rb
   ```

3. Call the methods with your desired inputs:
   ```ruby
   # Fibonacci
   puts fibs(8).inspect
   puts fibs_rec(8).inspect

   # Merge Sort
   puts merge_sort([38, 27, 43, 3, 9, 82, 10]).inspect
   ```

---

## License
This project is open-source and available under the MIT License.

---

Enjoy using these methods! If you have any questions or suggestions, feel free to open an issue or contribute to the repository.
