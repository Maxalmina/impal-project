require 'rails_helper'

RSpec.describe Furniture, type: :model do
  describe "initialization" do
    let(:furniture) { Furniture.new(name: "blue sofa", price: 94) }

    it "initializes Furniture given name and price" do
      expect(furniture.name).to eq("blue sofa")
      expect(furniture.price).to eq(94)
    end
  end

  describe "attributes" do
    let(:furniture) { Furniture.new }

    it "should have attribute name" do
      expect(furniture).to respond_to(:name)
    end

    it "should have attribute price" do
      expect(furniture).to respond_to(:price)
    end
  end

  describe "values" do
    let(:empty_furniture) { Furniture.new }
    let(:furniture) { Furniture.new(name: "blue sofa", price: -94) }

    it "are invalid without value of name" do
      empty_furniture.valid?
      expect(empty_furniture.errors[:name]).to be_present
    end

    it "are invalid without value of price" do
      empty_furniture.valid?
      expect(empty_furniture.errors[:price]).to be_present
    end

    it "are invalid with negative price" do
      furniture.valid?
      expect(furniture.errors[:price]).to be_present
    end
  end
end
