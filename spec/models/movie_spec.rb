require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'add movie without name' do
    a = Movie.new(description: 'demo description', director: 'abv')
    a.save
    expect(Movie.exists?(director: 'abv')).to eq(false)
  end
  it 'add movie with name' do
    a = Movie.new(name: 'demo name', director: 'abv')
    a.save
    expect(Movie.exists?(director: 'abv')).to eq(true)
  end
end
