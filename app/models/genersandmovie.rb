class Genersandmovie < ApplicationRecord
  belongs_to :movie
  belongs_to :genersofmovie

  validates :movie_id, uniqueness: { scope: :genersofmovie_id }
end
