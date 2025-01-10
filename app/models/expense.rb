class Expense < ApplicationRecord
  belongs_to :user
  validates :item_name, :cost, :logged_date, presence: true
end