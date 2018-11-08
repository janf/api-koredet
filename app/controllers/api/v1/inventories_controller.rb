module Api::V1
  class InventoriesController < ApplicationController


    before_action :authenticate_user!
    before_action :set_inventory, only: [:show, :edit, :update, :destroy]

    # GET /apiv1/locations
    # GET /apiv1/locations.json
    def index
      @inventories = Inventory.all.order(:id)
      render :json => @locations   #Using Location serializer by default
    end

    # GET /apiv1/locations/1
    # GET /apiv1/locations/1.json
    def show
      puts "SHOW INV --- Account_id: " + current_user.current_account_id.to_s + " Inventory id: " + @inventory.id.to_s
      render :json => @inventory
    end

    # GET /apiv1/locations/new
    #def new
    #  @location = Location.new
    #end

    # GET /apiv1/locations/1/edit
    #def edit
    #end

    # POST /apiv1/locations
    # POST /apiv1/locations.json
    def create
      @location = Location.new(location_params)

      if @location.save
        render :json => { status: :created, location: @location }
      else
        render :json => { errors: @location.errors, status: :unprocessable_entity }
      end
    end

    # PATCH/PUT /apiv1/locations/1
    # PATCH/PUT /apiv1/locations/1.json
    def update
      puts "Location::update (params): "  + location_params.inspect

      if @location.update(location_params)
        render :json => {status: :ok, location: @location }
      else
        render :json => {errors: @location.errors, status: :unprocessable_entity }
      end
    end

    # DELETE /apiv1/locations/1
    # DELETE /apiv1/locations/1.json
    def destroy
      @location.destroy
      render :json => { status: :deleted, head: :no_content }
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_inventory
        @inventory = Inventory.find(params[:id])
        puts "set_inventory"
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def inventory_params
        params.require(:inventory).permit(:id, :item_id, :location_id,:qty)
      end
  end
end
