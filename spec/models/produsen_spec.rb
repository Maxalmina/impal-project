require 'rails_helper'

RSpec.describe Produsen, type: :model do
  describe "initialization" do
    let(:produsen) {
      Produsen.new(
        name: "IKEA",
        description: "Test description"
      )
    }

    it "initializes Restaurant given attributes" do
      expect(produsen.name).to eq("IKEA")
      expect(produsen.description).to eq("Test description")
    end
  end

  describe "attributes" do
    let(:produsen) { Produsen.new }

    it "should have attribute name" do
      expect(produsen).to respond_to(:name)
    end

    it "should have attribute description" do
      expect(produsen).to respond_to(:description)
    end
  end

  describe "invalidation" do
    let(:produsen) { Produsen.new }

    it "is invalid without value of name" do
      produsen.valid?
      expect(produsen.errors[:name]).to be_present
    end

    it "is invalid without value of address" do
      produsen.valid?
      expect(produsen.errors[:description]).to be_present
    end
  end
end
