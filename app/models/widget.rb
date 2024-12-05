class Widget < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :stocks

  validates :category, inclusion: { in: ["time","stock_portfolio", "habits", "fitness"],
    message: "%{value} is not a valid category"}
end
