require 'rails_helper'

RSpec.describe Staranduser, type: :model do
  before :each do
    a = Star.new(name: 'gajksj', description: 'abv')
    a.save
    b = User.create(name: 'tahir ahmad', email: 'tahirbhalli16@gmail.com', password: 'sajkdhksahdka')
    b.save
  end
  it 'user all Liked Stars' do
    Staranduser.create(user_id: 1, star_id: 1)
    a = User.find(1)
    expect(a.stars.count).to eq(1)
  end
  it 'Most followd star' do
    Staranduser.create(user_id: 1, star_id: 1)
    a = Star.find(1)
    expect(a.users.count).to eq(1)
  end
end
