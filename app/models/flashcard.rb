class Flashcard < ApplicationRecord
  belongs_to :widget
  validates :answer, :question, presence: true
end
