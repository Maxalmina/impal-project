class CreateFurnitures < ActiveRecord::Migration[5.2]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :image
      t.references :produsen, foreign_key: true

      t.timestamps
    end
  end
end
