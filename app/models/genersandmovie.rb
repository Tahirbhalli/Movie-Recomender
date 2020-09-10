class Genersandmovie < ApplicationRecord
  after_create :check
  belongs_to :movie
  belongs_to :genersofmovie

  private

  def check
    raise ActiveRecord::Rollback if Genersandmovie.where(genersofmovie_id: genersofmovie_id,
                                                         movie_id: movie_id).count > 1
  end
end
