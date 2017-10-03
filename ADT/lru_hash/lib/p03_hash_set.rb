require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      resize! if num_buckets <= @count
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    i = num.hash % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0

    @store = Array.new(num_buckets * 2) {Array.new}

    old_store.flatten.each {|num| insert(num) }
  end
end
