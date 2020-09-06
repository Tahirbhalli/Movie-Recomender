require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user wrong email' do
    a = User.new(name: 'demo name', email: 'abv', password: 'asdjjkhsab4322jk')
    a.save
    expect(User.exists?(email: 'abv')).to eq(false)
  end
  it 'user right email' do
    a = User.new(name: 'demo name', email: 'abv@gmail.com', password: '123lkjaslkja')
    a.save
    expect(User.exists?(email: 'abv@gmail.com')).to eq(true)
  end
  it 'user short password length' do
    a = User.new(name: 'demo name', email: 'abv@gmail.com', password: 'asd')
    a.save
    expect(User.exists?(email: 'abv')).to eq(false)
  end
  it 'user email presence' do
    a = User.new(name: 'demo name', password: 'asdsadjsldla24')
    a.save
    expect(User.exists?(email: 'abv')).to eq(false)
  end
  
end
