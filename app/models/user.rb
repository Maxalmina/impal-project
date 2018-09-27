class User < ApplicationRecord
    enum role: [:customer, :produsen,:admin]
    validates :role, inclusion: { in: roles.keys }

    acts_as_authentic

    def customer?
        self.role == "customer"
    end

    def produsen?
        self.role == "produsen"
    end

    def admin?
        self.role == "admin"
    end
end
