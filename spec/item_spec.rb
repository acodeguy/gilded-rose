require './lib/item'

describe Item do

  before(:each) do
    @ultima_weapon = Item.new('Ultima Weapon', 10, 10)
  end

  it 'is created with a name, sell_in, and quality' do
    expect(@ultima_weapon.name).to eq 'Ultima Weapon'
    expect(@ultima_weapon.sell_in).to eq 10
    expect(@ultima_weapon.quality).to eq 10
  end

  it 'can print a friendly-formatted string of its current state' do
    expect(@ultima_weapon.to_s).to eq 'Ultima Weapon, 10, 10'
  end

end
