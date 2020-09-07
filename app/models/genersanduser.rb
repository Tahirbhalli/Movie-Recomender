class Genersanduser < ApplicationRecord
  after_create :check
  belongs_to :user
  belongs_to :genersofmovie

  private

  def check
    raise ActiveRecord::Rollback if Genersanduser.where(user_id: user_id, genersofmovie_id: genersofmovie_id).count > 1
  end
end
