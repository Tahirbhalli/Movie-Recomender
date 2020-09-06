class Movie < ApplicationRecord
    validates :name, presence: true
    has_many :liked_movies
    has_many :users, through: :liked_movies
end