class Staranduser < ApplicationRecord
  belongs_to :user
  belongs_to :star

  private

  def check
    raise ActiveRecord::Rollback if Staranduser.where(user_id: user_id, star_id: star_id).count > 1
  end
end
