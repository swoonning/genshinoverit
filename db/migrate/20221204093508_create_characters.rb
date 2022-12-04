class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.belongs_to :element, foreign_key: true
      t.string :name
      t.integer :rarity
      t.references :element_id
      t.string :constellation
      t.string :description

      t.timestamps
    end
  end
end
