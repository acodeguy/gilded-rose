require './lib/item'

class GenericItem < Item

  def alter_quality
    @sell_in -= 1
    @sell_in < 0 ? @quality -= 2 : @quality -= 1
  end
end
