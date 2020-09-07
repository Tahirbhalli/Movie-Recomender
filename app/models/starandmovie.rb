class Starandmovie < ApplicationRecord
  after_create :check
  belongs_to :star
  belongs_to :movie

  private

  def check
    raise ActiveRecord::Rollback if Starandmovie.where(star_id: star_id, movie_id: movie_id).count > 1
  end
end
