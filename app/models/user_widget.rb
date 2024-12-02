class UserWidget < ApplicationRecord
  belongs_to :user
  belongs_to :widget

  # Validation to ensure a user can't have the same widget more than once
  validates :user_id, uniqueness: { scope: :widget_id, message: "already has this widget" }
end
