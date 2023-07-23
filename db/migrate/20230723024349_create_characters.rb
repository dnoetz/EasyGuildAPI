class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :race, null: false
      t.string :class, null: false
      t.string :spec, null: false
      t.string :role, null: false
      t.references :roster, null: false, foreign_key: true
      t.timestamps
    end
  end
end
