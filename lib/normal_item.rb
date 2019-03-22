require './lib/item'

class NormalItem < Item

  def alter_quality
    @sell_in -= 1
  end

end