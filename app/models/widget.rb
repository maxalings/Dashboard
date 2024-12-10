class Widget < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :stocks
  has_many :flashcards
  has_many :races

  validates :category, inclusion: { in: ["time","stock_portfolio", "habits", "fitness", "flashcards", "map", "weather"],
    message: "%{value} is not a valid category"}

  def self.default_width(category)
    case category
    when "habits" then return 2
    when "fitness" then return 3
    when "stock_portfolio" then return 2
    when "flashcards" then return 3
    when "map" then return 2
    when "time" then return 1
    when "weather" then return 2
    else return 1
    end
  end

  def self.default_height(category)
    case category
    when "habits" then return 2
    when "fitness" then return 2
    when "stock_portfolio" then return 1
    when "flashcards" then return 1
    when "map" then return 2
    when "time" then return 1
    when "weather" then return 1
    else return 1
    end
  end


end
