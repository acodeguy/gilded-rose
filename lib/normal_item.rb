require './lib/item'

class NormalItem < Item

  def alter_quality

    @sell_in -= 1

    case @name
    when 'Aged Brie'
      @sell_in >= 0 ? @quality += 1 : @quality += 2
    when 'Backstage passes to a TAFKAL80ETC concert'
    else # generic item
      @sell_in < 0 ? @quality -= 2 : @quality -= 1
    end

    @quality < 0 ? @quality = 0 : @quality = @quality

  end

end