class CreateWidgets < ActiveRecord::Migration[7.0]
  def change
    create_table :widgets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.integer :position_x
      t.integer :position_y
      t.integer :width
      t.integer :height
      t.float :goal
      t.float :progress

      t.timestamps
    end
  end
end
