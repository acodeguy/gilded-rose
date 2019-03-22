require './lib/item'

class NormalItem < Item

  def alter_quality

    @sell_in -= 1

    case @name
    when 'Aged Brie'
      @quality += 1
    when 'Backstage passes to a TAFKAL80ETC concert'
    else
      @quality -= 1
    end

    @quality < 0 ? @quality = 0 : @quality = @quality

  end

end