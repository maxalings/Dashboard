class Widget < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :stocks
  has_many :flashcards

  validates :category, inclusion: { in: ["time","stock_portfolio", "habits", "fitness", "flashcards"],
    message: "%{value} is not a valid category"}

    def self.colors
      {
        "time" => {dark: "#86ADA5", light: "#CEE3DE", darkgrey: "#383838", grey: "#707070"},
        "stock_portfolio" => {dark: "#B4BE89", light: "#D6DEAF", darkgrey: "#383838", grey: "#707070"},
        "habits" => {dark: "#DB6D6B", light: "#F2CAC9", darkgrey: "#383838", grey: "#707070"},
        "fitness" => {dark: "#A487D4", light: "#D9CDED", darkgrey: "#383838", grey: "#707070"}
      }
  end
end
