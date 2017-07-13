# O(n!)
def first_anagram?(str1, str2)
  anagrams = str1.split('').permutation.to_a
  anagrams.any? { |word| word.join('') == str2 }
end

# O(n^2)
def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars

  str1.each_char do |s|
    if arr2.include?(s)
      arr2.delete_at(arr2.index(s))
    else
      return false
    end
    arr1.shift(1)
  end
  arr1.length == arr2.length
end

# O(nlogn)
def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

# O(n)
def fourth_anagram?(str1, str2)
  hash = Hash.new(0)

  str1.each_char { |s| hash[s] += 1 }
  str2.each_char { |s| hash[s] -= 1 }

  hash.all? {|k,v| v == 0}
end
