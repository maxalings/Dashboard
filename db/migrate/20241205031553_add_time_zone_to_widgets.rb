class AddTimeZoneToWidgets < ActiveRecord::Migration[7.0]
  def change
    add_column :widgets, :timezone, :string, default: "Paris"
  end
end
