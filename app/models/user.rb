class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, length: { maximum: 20 }
    validates :email, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 50 }, confirmation: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password_digest, presence: true, length: { minimum: 8, maximum: 50 }
end
