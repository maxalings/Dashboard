class AddWidgetToRace < ActiveRecord::Migration[7.0]
  def change
    add_reference :races, :widget, null: false, foreign_key: true
  end
end
