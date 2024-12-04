class RenameWidgetTypeToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :widgets, :type, :category
  end
end
