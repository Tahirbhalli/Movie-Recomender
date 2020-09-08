require 'rails_helper'

RSpec.describe Director, type: :model do
  before :each do
    Director.create(name: 'dummy')
    b = Movie.create(name: 'cast away', director_id: 1)
    b.save
  end
  it 'create a director' do
    Director.create(name: 'tahir ahad')
    expect(Director.count).to eq(2)
  end
  it 'director all movies' do
    director = Director.find(1)
    expect(director.movies.count).to eq(1)
  end
end
