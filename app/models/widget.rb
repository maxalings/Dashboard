class Widget < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :stocks
  has_many :flashcards

  validates :category, inclusion: { in: ["time","stock_portfolio", "habits", "fitness", "flashcards"],
    message: "%{value} is not a valid category"}
end
