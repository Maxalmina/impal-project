class User < ApplicationRecord
    acts_as_authentic

    def admin?
        self.username == "admin"
    end
    
    def customer?
        self.username != "admin"
    end
end
