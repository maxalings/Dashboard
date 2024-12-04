class Widget < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :stocks
end
