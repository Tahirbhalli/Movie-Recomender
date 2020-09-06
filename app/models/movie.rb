class Movie < ApplicationRecord
    validates :name, presence: true
    has_many :liked_movies
    has_many :users, through: :liked_movies
    has_many :genersandmovies
    has_many :genersofmovies, through: :genersandmovies
    has_many :movie_images
end