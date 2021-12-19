require_relative '../currency'

describe '#Currency' do
  it 'should returns valid change for 77' do
    expect(Currency.change_for(77)).to eq({ 'pennies' => 2, 'quarters' => 3 })
  end

  it 'should returns valid change for 41' do
    expect(Currency.change_for(41)).to eq({ 'pennies' => 1, 'quarters' => 1, 'dimes' => 1, 'nickels' => 1 })
  end

  it 'should through the error message' do
    expect(Currency.change_for(-1)).to eq('Error: Comparison of integer with nil failed')
  end
end
