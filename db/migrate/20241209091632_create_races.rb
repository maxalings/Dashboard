class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.integer :day
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
