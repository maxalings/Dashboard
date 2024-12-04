class AddDaysToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :monday, :boolean
    add_column :tasks, :tuesday, :boolean
    add_column :tasks, :wednesday, :boolean
    add_column :tasks, :thursday, :boolean
    add_column :tasks, :friday, :boolean
    add_column :tasks, :saturday, :boolean
    add_column :tasks, :sunday, :boolean
  end
end
