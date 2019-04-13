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

    context 'when item is Backstage passes to a TAFKAL80ETC concert' do
      context 'when sell_in is greater than 10' do
        it 'increases quality by one after each day' do
          normal_item = double('Backstage passes to a TAFKAL80ETC concert')
          allow(normal_item).to receive_messages(name: 'Backstage passes to a TAFKAL80ETC concert', quality: 1, alter_quality: 0)
          GildedRose.new([normal_item]).update_quality
          expect(normal_item.quality).to eq(1)
        end

        it 'never increases quality beyond 50' do
          normal_item = double('Backstage passes to a TAFKAL80ETC concert')
          allow(normal_item).to receive_messages(name: 'Backstage passes to a TAFKAL80ETC concert', quality: 50, alter_quality: 0)
          GildedRose.new([normal_item]).update_quality
          expect(normal_item.quality).to eq(50)
        end
      end

      context 'when sell_in is less than or equal to 10 but more than 5' do
        it 'increases quality by two after each day' do
          normal_item = double('Backstage passes to a TAFKAL80ETC concert')
          allow(normal_item).to receive_messages(name: 'Backstage passes to a TAFKAL80ETC concert', quality: 2, alter_quality: 0)
          GildedRose.new([normal_item]).update_quality
          expect(normal_item.quality).to eq(2)
        end

        it 'only raises quality to 50 when quality is at 49' do
          normal_item = double('Backstage passes to a TAFKAL80ETC concert')
          allow(normal_item).to receive_messages(name: 'Backstage passes to a TAFKAL80ETC concert', quality: 50, alter_quality: 0)
          GildedRose.new([normal_item]).update_quality
          expect(normal_item.quality).to eq(50)
        end
      end

      context 'when sell_in is less than or equal to 5 but more than 0' do
        it 'increases quality by three after each day' do
          normal_item = double('Backstage passes to a TAFKAL80ETC concert')
          allow(normal_item).to receive_messages(name: 'Backstage passes to a TAFKAL80ETC concert', quality: 3, alter_quality: 0)
          GildedRose.new([normal_item]).update_quality
          expect(normal_item.quality).to eq(3)
        end

        it 'only raises quality to 50 when quality is at 48 or more' do
          normal_item = double('Backstage passes to a TAFKAL80ETC concert')
          allow(normal_item).to receive_messages(name: 'Backstage passes to a TAFKAL80ETC concert', quality: 50, alter_quality: 0)
          GildedRose.new([normal_item]).update_quality
          expect(normal_item.quality).to eq(50)
        end
      end

      context 'after sell_in' do
        it 'sets quality to 0' do
          normal_item = double('Backstage passes to a TAFKAL80ETC concert')
          allow(normal_item).to receive_messages(name: 'Backstage passes to a TAFKAL80ETC concert', quality: 0, alter_quality: 0)
          GildedRose.new([normal_item]).update_quality
          expect(normal_item.quality).to eq(0)
        end

        it 'does not change quality' do
          normal_item = double('Backstage passes to a TAFKAL80ETC concert')
          allow(normal_item).to receive_messages(name: 'Backstage passes to a TAFKAL80ETC concert', quality: 0, alter_quality: 0)
          GildedRose.new([normal_item]).update_quality
          expect(normal_item.quality).to eq(0)
        end
      end
    end
  end
end
