require './lib/item'

class NormalItem < Item

  def alter_quality

    @sell_in -= 1

    case @name
    when 'Aged Brie'
      alter_aged_brie
    when 'Backstage passes to a TAFKAL80ETC concert'
      alter_pass
    else 
      alter_generic_item
    end

    enforce_upper_and_lower_quality_bounds
  end

  private

  def alter_pass
    @sell_in > 10 ? @quality += 1 : @quality
    @sell_in > 5 && @sell_in <= 10 ? @quality += 2 : @quality
    @sell_in > 0 && @sell_in <= 5 ? @quality += 3 : @quality
    @sell_in <= 0 ? @quality = 0 : @quality
  end

  def alter_aged_brie
    @sell_in >= 0 ? @quality += 1 : @quality += 2
  end

  def alter_generic_item
    @sell_in < 0 ? @quality -= 2 : @quality -= 1
  end

  def enforce_upper_and_lower_quality_bounds
    @quality < 0 ? @quality = 0 : @quality
    @quality > 50 ? @quality = 50 : @quality
  end
end
