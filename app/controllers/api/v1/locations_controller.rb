module Api::V1
  class LocationsController < ApplicationController


    before_action :authenticate_user!
    before_action :set_location, only: [:show, :edit, :update, :destroy]

    # GET /apiv1/locations
    # GET /apiv1/locations.json
    def index
      @locations = Location.roots.order(:location_name) 
      render :json => @locations   #Using Location serializer by default
    end

    # GET /apiv1/locations/1
    # GET /apiv1/locations/1.json
    def show
      render :json => Location.find(params[:id])
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
      def set_location
        @location = Location.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def location_params
        params.require(:location).permit(:id, :location_name,:location_type,:parent_id, :parent)
      end
  end
end
