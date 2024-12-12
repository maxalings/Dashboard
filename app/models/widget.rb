class Widget < ApplicationRecord
  after_create :default_flashcard
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :flashcards, dependent: :destroy
  has_many :races, dependent: :destroy

  validates :category, inclusion: { in: ["time","stock_portfolio", "habits", "fitness", "flashcards", "map", "weather"],
    message: "%{value} is not a valid category"}

  def default_flashcard()
    if category == "flashcards"
      Flashcard.create!(question: "What is the most famous dish from Indonesia ?", answer: "The Nasi Goreng", widget: self)
    end
  end

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
