require 'rails_helper'

RSpec.describe Genersanduser, type: :model do
  before :each do
    a = Star.new(name: 'gajksj', description: 'abv')
    a.save
    Director.create(name: 'dummy')
    b = Movie.create(name: 'cast away',director_id: 1)
    b.save
  end
  it 'Star all movies count' do
    Starandmovie.create(movie_id: 1, star_id: 1)
    b = Movie.create(name: 'run away',director_id: 1)
    b.save
    Starandmovie.create(movie_id: 2, star_id: 1)
    a = Star.find(1)
    expect(a.movies.count).to eq(2)
  end
  it 'movie all star' do
    Starandmovie.create(movie_id: 1, star_id: 1)
    b = Star.create(name: 'bumrah')
    b.save
    Starandmovie.create(movie_id: 1, star_id: 2)
    a = Movie.find(1)
    expect(a.stars.count).to eq(2)
  end
end
