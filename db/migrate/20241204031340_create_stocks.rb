class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.references :widget, null: false, foreign_key: true
      t.string :tickr
      t.float :amount
      t.float :purchase_price

      t.timestamps
    end
  end
end
