class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 50 }, confirmation: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8, maximum: 50 }
  has_many :liked_movies
  has_many :movies, through: :liked_movies, dependent: :destroy
  has_many :genersandusers
  has_many :genersofmovies, through: :genersandusers, dependent: :destroy
  has_many :starandusers
  has_many :stars, through: :starandusers, dependent: :destroy
end
