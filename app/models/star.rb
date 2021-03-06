class Star < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  has_many :starandusers
  has_many :users, through: :starandusers, dependent: :destroy
  has_many :starandmovies
  has_many :movies, through: :starandmovies, dependent: :destroy
end
