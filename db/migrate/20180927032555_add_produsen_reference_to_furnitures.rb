class AddProdusenReferenceToFurnitures < ActiveRecord::Migration[5.2]
  def change
    add_reference :furnitures, :produsen, foreign_key: { to_table: :users }
  end
end
