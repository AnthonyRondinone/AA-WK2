def bad_two_sum?(arr, target_sum)
  arr.permutation(2).any? { |num| num.inject(:+) == target_sum }
end

def ok_two_sum(arr, target_sum)
  sorted = arr.sort

  pivot = sorted.length / 2
  left = sorted[0...pivot]
  right = sorted[pivot..-1]


end

def two_sum?(arr, target)

  hash = Hash.new(0)

  arr[0..-1].each do |num|
    return true if hash.keys.any? {|key| key + num == target }
    unless hash.keys.include?(num)
      hash[num] += 1
    end
  end
  false

end
