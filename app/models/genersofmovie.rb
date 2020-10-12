class Genersofmovie < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  has_many :genersandmovies
  has_many :movies, through: :genersandmovies, dependent: :destroy
  has_many :genersandusers
  has_many :users, through: :genersandusers, dependent: :destroy
end
