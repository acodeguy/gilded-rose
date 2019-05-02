require './lib/generic_item'
require './lib/aged_brie'
require './lib/sulfuras'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.alter_quality
    end
  end
end
