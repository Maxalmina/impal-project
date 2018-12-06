class ProdusensController < ApplicationController
    before_action :require_login, only: [:show]

    before_action :set_produsen, only: [:show, :edit, :update, :destroy]

    def index
        @produsens = Produsen.all
    end

    def show
    end

    def new
        @produsen = Produsen.new
    end

    def edit
    end

    def create
        @produsen = Produsen.new(produsen_params)

        respond_to do |format|
        if @produsen.save
            format.html { redirect_to @produsen, notice: "produsen was successfully created." }
            format.json { render :show, status: :created, location: @produsen }
        else
            format.html { render :new }
            format.json { render json: @produsen.errors, status: :unprocessable_entity }
        end
        end
    end

    def updated
        respond_to do |format|
        if @produsen.update(produsen_params)
            format.html { redirect_to @produsen, notice: "produsen was successfully updated." }
            format.json { render :show, status: :ok, location: @produsen }
        else
            format.html { render :edit }
            format.json { render json: @produsen.errors, status: :unprocessable_entity }
        end
        end
    end

    def destroy
        @produsen.destroy
        respond_to do |format|
            format.html { redirect_to produsens_url, notice: "produsen was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

        def set_produsen
            @produsen = Produsen.find(params[:id])
        end

        def produsen_params
            filtered_params.slice(:name, :description)
      end
end
