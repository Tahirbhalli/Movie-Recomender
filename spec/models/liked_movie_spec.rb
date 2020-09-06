require 'rails_helper'

RSpec.describe LikedMovie, type: :model do
  before :each do
    a = User.new(name: 'gajksj', email: 'user@example.com', password: 'password1234')
    a.save
    b= Movie.create(name: 'cast away')
    b.save
  end
  it 'user all Liked movie' do
    LikedMovie.create(user_id: 1,movie_id: 1)
    a=User.find(1)
    expect(a.movies.count).to eq(1)
  end
  it 'Movie all followers' do
    LikedMovie.create(user_id: 1,movie_id: 1)
    a=Movie.find(1)
    expect(a.users.count).to eq(1)
  end
end
