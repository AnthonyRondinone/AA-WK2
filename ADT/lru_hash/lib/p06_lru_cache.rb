require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      update_link!(@map[key])
      return @map[key]
    else
      calc!(key)
    end

  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)

    eject! if @map.count == @max

    val = @prc.call(key)
    new_link = @store.append(key, val)
    @map[key] = new_link
    val
  end

  def update_link!(link)
    @store.remove(link.key)
    @map[link.key] = @store.append(link.key, link.val)
  end

  def eject!
    ejected_link = @store.first
    @store.remove(ejected_link.key)
    @map.delete(ejected_link.key)
  end
end
