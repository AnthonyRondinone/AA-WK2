require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if self.include?(key)
      bucket(key).update(key, val)
    else
      bucket(key).append(key, val)
      @count += 1
      resize! if num_buckets <= @count
    end
  end

  def get(key)
    bucket(key).each do |link|
      if link.key == key
        return link.val
      end
    end
    nil
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each
    @store.each do |bucket|
      bucket.each do |link|
        yield(link.key, link.val)
      end
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    old_store.each do |bucket|
      bucket.each {|link| set(link.key, link.val)}
    end
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end