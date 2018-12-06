class FurnituresController < ApplicationController
    before_action :require_admin, only: [:index, :show, :new, :edit, :create, :update, :destroy]

    before_action :set_furniture, only: [:show, :edit, :update, :destroy]
    before_action :set_produsen, only: [:index, :new, :create]

    def index
        @furnitures = Furniture.where(produsen: @produsen)
    end

    def show
    end

    def new
        @furniture = Furniture.new
    end

    def edit
    end

    def create
        @furniture = furniture.new(furniture_params)

        respond_to do |format|
        if @furniture.save
            format.html { redirect_to @furniture, notice: "furniture was successfully created." }
            format.json { render :show, status: :created, location: @furniture }
        else
            format.html { render :new }
            format.json { render json: @furniture.errors, status: :unprocessable_entity }
        end
        end
    end

    def updated
        respond_to do |format|
        if @furniture.update(furniture_params)
            format.html { redirect_to @furniture, notice: "furniture was successfully updated." }
            format.json { render :show, status: :ok, location: @furniture }
        else
            format.html { render :edit }
            format.json { render json: @furniture.errors, status: :unprocessable_entity }
        end
        end
    end

    def destroy
        @furniture.destroy
        respond_to do |format|
            format.html { redirect_to furnitures_url, notice: "furniture was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

        def set_furniture
            @furniture = Furniture.find(params[:id])
        end

        def set_produsen
            @produsen = Produsen.find(params[:produsen_id])
        end

        def furniture_params
            params.require(:furniture).permit(:name, :price, :description, :image, :produsen_id)
      end
end
