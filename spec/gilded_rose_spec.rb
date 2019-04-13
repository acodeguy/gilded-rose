require 'gilded_rose'

describe GildedRose do

  it '#update_quality is called on each item given' do
    sword = double('sword')
    gun = double('gun')
    expect(sword).to receive_messages(alter_quality: nil)
    expect(gun).to receive_messages(alter_quality: nil)
    GildedRose.new([sword, gun]).update_quality
  end
end
