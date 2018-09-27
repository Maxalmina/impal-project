class CreateFurnitures < ActiveRecord::Migration[5.2]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
