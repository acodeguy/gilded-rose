require './lib/item'

class AgedBrie < Item

  def alter_quality
    @sell_in -= 1
    @sell_in >= 0 ? @quality += 1 : @quality += 2
    @quality > 50 ? @quality = 50 : @quality
  end
end
