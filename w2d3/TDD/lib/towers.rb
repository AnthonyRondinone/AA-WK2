class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = Array.new(3) { [] }
    towers[0] = [3,2,1]
  end

  def move(start_tower, end_tower)
    unless towers[end_tower].empty?
      raise "Can't do that." if towers[end_tower].last < towers[start_tower].last
    end

    towers[end_tower] << towers[start_tower].pop

  end

  def won?
    towers[1..2].any?{ |t| t.length == 3 } 
  end
end
