require './lib/aged_brie'

describe AgedBrie do
  context 'when item is Aged Brie' do
    context 'before sell_in' do
      it 'raises quality by one after a day' do
        item = AgedBrie.new("Aged Brie", 1, 0)
        item.alter_quality
        expect(item.quality).to eq(1)
      end

      it 'never raises quality beyond 50' do
        item = AgedBrie.new("Aged Brie", 1, 50)
        item.alter_quality
        expect(item.quality).to eq(50)
      end
    end

    context 'after sell_in' do
      it 'raises quality by two after a day' do
        item = AgedBrie.new("Aged Brie", 0, 0)
        item.alter_quality
        expect(item.quality).to eq(2)
      end

      it 'only raises quality to 50 when quality is at 49' do
        item = AgedBrie.new("Aged Brie", 0, 49)
        item.alter_quality
        expect(item.quality).to eq(50)
      end
    end
  end
end
