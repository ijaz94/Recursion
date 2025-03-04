def fibs(num)
  return [] if num <= 0
  return [0] if num == 1

  sequence = [0, 1] # Start with the first two Fibonacci numbers
  (2...num).each do |i|
    sequence << sequence[i - 1] + sequence[i - 2] # Add the next Fibonacci number
  end
  sequence[0...num] # Ensure the array contains exactly `num` elements
end

puts "Iterative: #{fibs(8).inspect}"

def fibs_rec(num, sequence = [0, 1])
  return [] if num <= 0
  return [0] if num == 1
  return sequence[0...num] if sequence.length >= num

  sequence << sequence[-1] + sequence[-2] # Add the next Fibonacci number
  fibs_rec(num, sequence) # Recur with the updated sequence
end

puts "Recursive: #{fibs_rec(8).inspect}"
  