class AddUserWidgetToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :user_widget, null: false, foreign_key: true
  end
end
