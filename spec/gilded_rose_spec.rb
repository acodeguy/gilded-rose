require 'gilded_rose'
require 'item'
require 'normal_item'
require 'legendary_item'

describe GildedRose do

  describe "#update_quality" do

    context 'when item is Sulfuras, Hand of Ragnaros' do
      it 'does not change sell_in' do
        legendary_item = double('Aged Brie')
        allow(legendary_item).to receive_messages(name: 'Sulfuras, Hand of Ragnaros', sell_in: 1, alter_quality: 0)
        GildedRose.new([legendary_item]).update_quality
        expect(legendary_item.sell_in).to eq(1)
      end

      it 'does not change quality' do
        legendary_item = double('Aged Brie')
        allow(legendary_item).to receive_messages(name: 'Sulfuras, Hand of Ragnaros', quality: 80, alter_quality: 0)
        GildedRose.new([legendary_item]).update_quality
        expect(legendary_item.quality).to eq(80)
      end
    end
  end
end
