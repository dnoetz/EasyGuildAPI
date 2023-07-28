class AddProfessionsToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :professions, :string
  end
end
