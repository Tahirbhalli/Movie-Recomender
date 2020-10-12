class Starandmovie < ApplicationRecord
  belongs_to :star
  belongs_to :movie

  validates :star_id, uniqueness: { scope: :movie_id }
end
