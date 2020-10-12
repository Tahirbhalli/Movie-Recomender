class Staranduser < ApplicationRecord
  belongs_to :user
  belongs_to :star

  validates :user_id, uniqueness: { scope: :star_id }
end
