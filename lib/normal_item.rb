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

    @quality < 0 ? @quality = 0 : @quality = @quality
    @quality > 50 ? @quality = 50 : @quality = @quality
  end

  private

  def alter_pass
    @sell_in > 10 ? @quality += 1 : @quality = @quality
    @sell_in > 5 && @sell_in <= 10 ? @quality += 2 : @quality = @quality
    @sell_in > 0 && @sell_in <= 5 ? @quality += 3 : @quality = @quality
    @sell_in <= 0 ? @quality = 0 : @quality = @quality
  end

  def alter_aged_brie
    @sell_in >= 0 ? @quality += 1 : @quality += 2
  end

  def alter_generic_item
    @sell_in < 0 ? @quality -= 2 : @quality -= 1
  end
end