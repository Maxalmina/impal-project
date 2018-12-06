require 'rails_helper'

RSpec.describe TransaksisController, type: :controller do
    let(:valid_attributes) {
        skip("Add a hash of attributes valid for your model")
    }
    
    let(:invalid_attributes) {
        skip("Add a hash of attributes invalid for your model")
    }
    
    let(:valid_session) { {} }
    
    describe "GET #index" do
        it "returns a success response" do
          Transaksi.create! valid_attributes
          get :index, params: {}, session: valid_session
          expect(response).to be_success
        end
    end
    
    describe "GET #show" do
        it "returns a success response" do
            transaksi = Transaksi.create! valid_attributes
            get :show, params: { id: transaksi.to_param }, session: valid_session
            expect(response).to be_success
        end
    end
    
    describe "POST #create" do
        context "with valid params" do
            it "creates a new Transaksi" do
                expect {
                post :create, params: { transaksi: valid_attributes }, session: valid_session
                }.to change(Transaksi, :count).by(1)
            end
    
            it "redirects to the created transaksi" do
                post :create, params: { transaksi: valid_attributes }, session: valid_session
                expect(response).to redirect_to(Transaksi.last)
            end
        end
    
        context "with invalid params" do
          it "returns a success response (i.e. to display the 'new' template)" do
            post :create, params: { transaksi: invalid_attributes }, session: valid_session
            expect(response).to be_success
          end
        end
      end
    
      describe "PUT #update" do
        context "with valid params" do
            let(:new_attributes) {
                skip("Add a hash of attributes valid for your model")
            }
    
            it "updates the requested transaksi" do
                transaksi = Transaksi.create! valid_attributes
                put :update, params: { id: transaksi.to_param, transaksi: new_attributes }, session: valid_session
                transaksi.reload
                skip("Add assertions for updated state")
            end
    
            it "redirects to the transaksi" do
                transaksi = Transaksi.create! valid_attributes
                put :update, params: { id: transaksi.to_param, transaksi: valid_attributes }, session: valid_session
                expect(response).to redirect_to(transaksi)
            end
        end
    
        context "with invalid params" do
            it "returns a success response (i.e. to display the 'edit' template)" do
                transaksi = Transaksi.create! valid_attributes
                put :update, params: { id: transaksi.to_param, transaksi: invalid_attributes }, session: valid_session
                expect(response).to be_success
            end
        end
      end
    
      describe "DELETE #destroy" do
        it "destroys the requested transaksi" do
            transaksi = Transaksi.create! valid_attributes
            expect {
                delete :destroy, params: { id: transaksi.to_param }, session: valid_session
            }.to change(Transaksi, :count).by(-1)
        end
    
        it "redirects to the transaksis list" do
          transaksi = Transaksi.create! valid_attributes
          delete :destroy, params: { id: transaksi.to_param }, session: valid_session
          expect(response).to redirect_to(transaksis_url)
        end
    end
end
