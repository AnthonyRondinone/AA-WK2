list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]


#  O(n^2) - time
#  O(1) - space
def my_min_i(list)
  list.each do |l1|
    smallest = false
    list.each do |l2|
      next if l1 == l2
      smallest = true if l2 > l1
    end
    return l1 if smallest
  end
end

# O(n)
def my_min_ii(list)
  smallest = list.first
  list.each do |l1|
    if l1 < smallest
      smallest = l1
    end
  end
  smallest
end


# O(n^2 + 2n + 2) => n^2
def l_c_sum_i(list)
  subsets = []
  list[0..-1].each_index do |idx2|
    list[0..idx2].each_index do |idx1|
      subsets << list[idx1..idx2]
    end
  end
  sub_sums = []
  subsets.each do |subs|
    sub_sums << subs.inject(:+)
  end
  sub_sums.max
end


#
def l_c_sum_ii(list)
  greatest_sum = list.first
  tally_sum = 0

  list[0..-1].each do |num|

    tally_sum += num

    if tally_sum > greatest_sum
      greatest_sum = tally_sum
    end

    if tally_sum < 0
      tally_sum = 0
    end

  end

  greatest_sum
end
