class TransaksisController < ApplicationController
    before_action :require_login, only: [:create, :show, :update, :destroy]
    before_action :set_transaksi, only: [:show, :update, :destroy]

    def index
        if current_user.customer?
            @transaksis = Transaksi.where(user: current_user.id)
        elsif current_user.admin?
            @transaksis = Transaksi.all
        end
    end

    def create
        customer = User.find(transaksi_params[:user_id])
        require_specific(customer)
    
        @transaksi = Transaksi.new(transaksi_params)
        create_transaction_details if saved = @transaksi.save
    
        respond_to do |format|
          if saved
            format.html { redirect_to @transaksi, notice: "Transaksi was successfully created." }
            format.json { render :show, status: :created, location: @transaksi }
          else
            format.html { redirect_to Produsen.find(transaksi_params[:produsen_id]) }
            format.json { render json: @transaksi.errors, status: :unprocessable_entity }
          end
        end
    end

    def show
        require_specific(@transaksi.user) if current_user.customer?
    end

    def update
        user = User.find(transaksi_update_params[:user_id])
        require_specific(user) if !@transaksi.cart?
    
        updated = @otransaksi.update(transaksi_update_params)
        @transaksis.update_status if updated && update_status? && update_status_allowed?
    
        respond_to do |format|
          if updated
            format.html { redirect_to @transaksi, notice: "Transaksi was successfully updated." }
            format.json { render :show, status: :ok, location: @transaksi }
          else
            format.html { render :show }
            format.json { render json: @transaksi.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @transaksi.destroy
        respond_to do |format|
          format.html { redirect_to transaksis_url, notice: "Transaksi was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private

        def set_transaksi
            @transaksi = Transaksi.find(params[:id])
        end

        def filtered_params
            params.require(:transaksi).permit(:produsen_id, :user_id, :update_status, furnitures: {})
        end

        def transaksi_params
            filtered_params.slice(:produsen_id, :user_id)
        end
      
        def transaksi_update_params
            transaksi_params.slice(:user_id)
        end

        def create_transaction_details
            filtered_params[:furnitures].each do |furniture_id, quantity|
                TransactionDetail.create(transaksi_id: @transaksi.id, furniture_id: furniture_id, quantity: quantity)
            end
        end
        def update_status?
            filtered_params[:update_status]
        end

        def update_status_allowed?
            ( current_user.admin? && @transaksi.status != "cart" ) || ( @transaksi.owned?(current_user) && @transaksi.status == "cart" )
        end
end
