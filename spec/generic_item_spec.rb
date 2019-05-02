require './lib/generic_item'

describe GenericItem do

  context 'when item is generic' do
    context 'before sell_in' do
      it 'lowers quality by one after one day' do
        item = GenericItem.new("item", 1, 1)
        item.alter_quality
        expect(item.quality).to eq(0)
      end
    end

    context 'after sell_in' do
      it 'lowers quality by two after a day' do
        item = GenericItem.new("item", 0, 2)
        item.alter_quality
        expect(item.quality).to eq(0)
      end
    end
  end

  it "does not change the name" do
    item = GenericItem.new('foo', 1, 1)
    item.alter_quality
    expect(item.name).to eq 'foo'
  end

  it "never lowers quality below 0" do
    item = GenericItem.new('item', 1, 1)
    item.alter_quality
    expect(item.quality).to eq(0)
  end

  it "lowers the sell_in by one after a day" do
    item = GenericItem.new('item', 1, 1)
    item.alter_quality
    expect(item.sell_in).to eq 0
  end
  
end
