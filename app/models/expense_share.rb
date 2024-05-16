# == Schema Information
#
# Table name: expense_shares
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  expense_id :bigint           not null
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ExpenseShare < ApplicationRecord
  belongs_to :user
  belongs_to :expense
end
