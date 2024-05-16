# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  creator_id  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Group < ApplicationRecord
  belongs_to :creator
  has_many :group_memberships
  has_many :users, through: :group_memberships
  has_many :expenses
end
