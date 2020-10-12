class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  has_many :liked_movies
  has_many :users, through: :liked_movies, dependent: :destroy
  has_many :genersandmovies
  has_many :genersofmovies, through: :genersandmovies, dependent: :destroy
  has_many :movie_images
  has_many :starandmovies
  has_many :stars, through: :starandmovies, dependent: :destroy
  belongs_to :director
end
