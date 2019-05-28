require './lib/item'
require './lib/quality_bounds'

class AgedBrie < Item

  include QualityBounds

  def alter_quality
    @sell_in -= 1
    @sell_in >= 0 ? @quality += 1 : @quality += 2
    enforce_quality_bounds
  end
end
