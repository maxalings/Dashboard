class Widget < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :stocks
  has_many :flashcards

  validates :category, inclusion: { in: ["time","stock_portfolio", "habits", "fitness", "flashcards"],
    message: "%{value} is not a valid category"}

  def self.default_width(category)
    case category
    when "habits" then return 2
    else return 1
    end
  end

  def self.default_height(category)
    case category
    when "habits" then return 2
    else return 1
    end
  end

  
end
