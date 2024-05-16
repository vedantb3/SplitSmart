# == Schema Information
#
# Table name: expenses
#
#  id          :bigint           not null, primary key
#  description :string
#  amount      :decimal(, )
#  group_id    :bigint           not null
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Expense < ApplicationRecord
  belongs_to :group
  belongs_to :user

  has_many :expense_shares
  has_many :users, through: :expense_shares

  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
