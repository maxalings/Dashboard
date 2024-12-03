class AddColumnsToUserWidgets < ActiveRecord::Migration[7.0]
  def change
    add_column :user_widgets, :x, :integer
    add_column :user_widgets, :y, :integer
    add_column :user_widgets, :height, :integer
    add_column :user_widgets, :width, :integer
  end
end
