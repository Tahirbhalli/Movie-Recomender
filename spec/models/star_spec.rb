require 'rails_helper'

RSpec.describe Star, type: :model do
  it 'create Star' do
    a = Star.new(name: 'demo name', description: 'abv')
    a.save
    expect(Star.where(name: 'demo name').exists?).to eq(true)
  end
end
