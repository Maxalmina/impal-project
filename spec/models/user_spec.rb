require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    let(:user) { User.new }

    it "should have attribute username" do
      expect(user).to respond_to(:username)
    end

    it "should have attribute email" do
      expect(user).to respond_to(:email)
    end

    it "should have attribute password" do
      expect(user).to respond_to(:password)
    end

    it "should have attribute password" do
      expect(user).to respond_to(:alamat)
    end

    it "should have attribute password" do
      expect(user).to respond_to(:telp)password
    end
  end

end
