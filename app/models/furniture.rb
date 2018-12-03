class Furniture < ApplicationRecord
    validates :name, :price, :image, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }

    belongs_to :produsen
end
