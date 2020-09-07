class LikedMovie < ApplicationRecord
  after_create :check
  belongs_to :user
  belongs_to :movie

  private

  def check
    raise ActiveRecord::Rollback if LikedMovie.where(user_id: user_id, movie_id: movie_id).count > 1
  end
end
