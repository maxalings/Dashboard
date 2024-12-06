class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.string :question
      t.string :answer
      t.references :widget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
