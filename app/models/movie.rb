class Movie < ApplicationRecord
  validates :name, presence: true
  has_many :liked_movies
  has_many :users, through: :liked_movies
  has_many :genersandmovies
  has_many :genersofmovies, through: :genersandmovies
  has_many :movie_images
  has_many :starandmovies
  has_many :stars, through: :starandmovies
end
