class Task < ApplicationRecord
  belongs_to :user_widget

  validates :done, :title, presence: true
end
