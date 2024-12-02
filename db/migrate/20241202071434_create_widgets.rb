class CreateWidgets < ActiveRecord::Migration[7.0]
  def change
    create_table :widgets do |t|
      t.string :name
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
