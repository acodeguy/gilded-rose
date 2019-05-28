require './lib/item'
require './lib/quality_bounds'

class BackstagePass < Item

  include QualityBounds

  def alter_quality
    @sell_in -= 1
    adjust_quality
    enforce_quality_bounds
  end

  private
  
  def adjust_quality
    case @sell_in
    when -Float::INFINITY..0 then @quality = 0
    when 1..5 then @quality += 3
    when 5..10 then @quality += 2
    when 11..Float::INFINITY then @quality += 1
    end
  end

end
