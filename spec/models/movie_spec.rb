require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'add movie without name' do
    Director.create(name: 'dummy')
    a = Movie.new(description: 'demo description', director_id: 1)
    a.save
    expect(Movie.exists?(description: 'demo description')).to eq(false)
  end
  it 'add movie with name' do
    Director.create(name: 'dummy')
    a = Movie.new(name: 'demo name', director_id: 1)
    a.save
    expect(Movie.exists?(name: 'demo name')).to eq(true)
  end
end
