require 'rails_helper'

RSpec.describe Genersandmovie, type: :model do
  before :each do
    a = Genersofmovie.new(name: 'Action')
    a.save
    b = Movie.create(name: 'cast away')
    b.save
  end
  it 'movie Generes type' do
    Genersandmovie.create(movie_id: 1, genersofmovie_id: 1)
    a = Movie.find(1)
    expect(a.genersofmovies.count).to eq(1)
  end
  it 'geners all movies types' do
    Genersandmovie.create(movie_id: 1, genersofmovie_id: 1)
    a = Genersofmovie.find(1)
    expect(a.movies.count).to eq(1)
  end
end
