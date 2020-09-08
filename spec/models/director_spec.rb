require 'rails_helper'

RSpec.describe Director, type: :model do
  before do
    Director.create(name: 'dummy')
    b = Movie.create(name: 'cast away', director_id: 1)
    b.save
  end
  it 'create a director' do
    Director.create(name: 'tahir ahad')
    expect(Director.where(name: 'tahir ahad').exists?).to eq(true)
  end
  it 'director all movies' do
    director = Director.find(1)
    expect(director.movies.where(name: 'cast away').exists?).to eq(true)
  end
end
