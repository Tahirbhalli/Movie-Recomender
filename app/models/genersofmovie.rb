class Genersofmovie < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: true }
    has_many :genersandmovies
    has_many :movies, through: :genersandmovies
end
