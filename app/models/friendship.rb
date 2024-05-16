# == Schema Information
#
# Table name: friendships
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  friend_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend

  validates :user_id, uniqueness: { scope: :friend_id }

  after_create :create_inverse, unless: :inverse_exists?
  after_destroy :destroy_inverse, if: :inverse_exists?

  private

  def create_inverse
    self.class.create(inverse_friendship_options)
  end

  def destroy_inverse
    inverse_friendship.destroy
  end

  def inverse_exists?
    self.class.exists?(inverse_friendship_options)
  end

  def inverse_friendship
    self.class.find_by(inverse_friendship_options)
  end

  def inverse_friendship_options
    { user_id: friend_id, friend_id: user_id }
  end
end
