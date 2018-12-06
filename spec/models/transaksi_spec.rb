require 'rails_helper'

RSpec.describe Transaksi, type: :model do
    describe "attributes" do
      let(:transaksi) { Transaksi.new }

      it "should have attribute user" do
        expect(transaksi).to respond_to(:user)
      end

      it "should have attribute produsen" do
        expect(transaksi).to respond_to(:produsen)
      end
    end

    describe "status" do
      let(:statuses) { %i(cart pending ordered completed) }
      let(:transaksi) { Transaksi.new }

      it "should have available as default status" do
        expect(transaksi.status).to eq("cart")
      end

      it "should be valid with certain status" do
        statuses.each do |status|
          transaksi.status = status
          transaksi.valid?
          expect(transaksi.errors[:status]).to_not be_present
        end
      end

      it "should update its status upon calling update_status" do
        statuses[1..-1].each do |status|
          transaksi.update_status
          expect(transaksi.status).to eq(status.to_s)
        end
      end
  end
end
