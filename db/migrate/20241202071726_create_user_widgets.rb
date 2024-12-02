class CreateUserWidgets < ActiveRecord::Migration[7.0]
  def change
    create_table :user_widgets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :widget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
