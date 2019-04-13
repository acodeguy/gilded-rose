require './lib/normal_item'

describe Item do

  it "does not change the name" do
    item = NormalItem.new('foo', 0, 0)
    GildedRose.new([item]).update_quality
    expect(item.name).to eq 'foo'
  end

  it "lowers the sell_in by one after a day" do
    item = NormalItem.new("item", 1, 0)
    GildedRose.new([item]).update_quality
    expect(item.sell_in).to eq 0
  end

  it "never lowers quality below 0" do
    item = NormalItem.new("item", 0, 0)
    GildedRose.new([item]).update_quality
    expect(item.quality).to eq(0)
  end

  context 'when item is generic' do
    context 'before sell_in' do
      it 'lowers quality by one after one day' do
        item = NormalItem.new("item", 1, 1)
        GildedRose.new([item]).update_quality
        expect(item.quality).to eq(0)
      end
    end

    context 'after sell_in' do
      it 'lowers quality by two after a day' do
        item = NormalItem.new("item", 0, 2)
        GildedRose.new([item]).update_quality
        expect(item.quality).to eq(0)
      end
    end
  end

  context 'when item is Aged Brie' do
    context 'before sell_in' do
      it 'raises quality by one after a day' do
        item = NormalItem.new("Aged Brie", 1, 0)
        GildedRose.new([item]).update_quality
        expect(item.quality).to eq(1)
      end

      it 'never raises quality beyond 50' do
        item = NormalItem.new("Aged Brie", 1, 50)
        GildedRose.new([item]).update_quality
        expect(item.quality).to eq(50)
      end
    end

    context 'after sell_in' do
      it 'raises quality by two after a day' do
        item = NormalItem.new("Aged Brie", 0, 0)
        GildedRose.new([item]).update_quality
        expect(item.quality).to eq(2)
      end

      it 'only raises quality to 50 when quality is at 49' do
        item = NormalItem.new("Aged Brie", 0, 49)
        GildedRose.new([item]).update_quality
        expect(item.quality).to eq(50)
      end
    end
  end

end
