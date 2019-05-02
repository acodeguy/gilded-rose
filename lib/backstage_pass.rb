require './lib/item'

class BackstagePass < Item

  def alter_quality
    @sell_in -= 1
    @sell_in > 10 ? @quality += 1 : @quality
    @sell_in > 5 && @sell_in <= 10 ? @quality += 2 : @quality
    @sell_in > 0 && @sell_in <= 5 ? @quality += 3 : @quality
    @sell_in <= 0 ? @quality = 0 : @quality

    @quality > 50 ? @quality = 50 : @quality
  end  
end
