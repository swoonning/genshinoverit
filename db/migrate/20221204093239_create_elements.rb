class CreateElements < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.string :element

      t.timestamps
    end
  end
end
