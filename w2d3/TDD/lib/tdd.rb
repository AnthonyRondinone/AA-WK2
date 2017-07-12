class Array
  def my_uniq
    new_arr = []
    self.each_index do |i|
      unless self[0...i].include?(self[i])
        new_arr << self[i]
      end
    end
    new_arr
  end

  def two_sum
    arr = []

    self.each_index do |i2|
      self[0...i2].each_index do |i1|
        arr << [i1, i2] if self[i1] + self[i2] == 0
      end
    end
    arr
  end

  def my_transpose
    unless self.all? { |row| row.length == self.first.length }
      raise "Invalid input matrix"
    end

    transposed = Array.new(self.first.length) { [] }
    self.each do |row|
      self.each_index do |col|
        transposed[col] << row[col]
      end
    end
    transposed
  end

  def stock_picker
    best_profit = self[1] - self[0]
    best_pair = [0,1]
    self.each_index do |i2|
      self[0...i2].each_index do |i1|
        profit = self[i2] - self[i1]
        if profit > best_profit
          best_pair = [i1,i2]
          best_profit = profit
        end
      end
    end
    best_pair
  end
end
