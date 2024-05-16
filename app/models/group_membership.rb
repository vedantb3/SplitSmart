# == Schema Information
#
# Table name: group_memberships
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  group_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
