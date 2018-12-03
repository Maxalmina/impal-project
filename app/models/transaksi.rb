class Transaksi < ApplicationRecord
    enum status: [:cart, :pending, :ordered, :completed]
    validates :status, inclusion: { in: statuses.keys }

    belongs_to :user
    belongs_to :produsen

    has_many :transaction_details
    
    def total_price
        self.transaction_details.reduce(0) { |sum, furniture| sum + (furniture.price * furniture.quantity) }
    end

    def update_status
        status = Transaksi.statuses[self.status] + 1
        self.update(status: status) if Transaksi.statuses.has_value?(status)
    end
    
    def cart?
        self.status == "cart"
    end

    def owned?(current_user)
        self.user == current_user
    end
end
