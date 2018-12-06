class Produsen < ApplicationRecord
    validates :name, :description, presence: true
    has_many :furnitures
end
