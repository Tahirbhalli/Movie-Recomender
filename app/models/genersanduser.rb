class Genersanduser < ApplicationRecord
  belongs_to :user
  belongs_to :genersofmovie

  validates :user_id, uniqueness: { scope: :genersofmovie_id }
end
