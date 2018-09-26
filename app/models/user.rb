class User < ApplicationRecord
    enum role: [:customer, :produsen]
    validates :role, inclusion: { in: roles.keys }

    acts_as_authentic

    def produsen?
        self.role == "produsen"
    end

    def customer?
        self.role == "customer"
    end
end
