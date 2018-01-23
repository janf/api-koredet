module Api::V1
	class ItemsController < ApplicationController

 	before_action :authenticate_user!
    before_action :set_item, only: [:show, :edit, :update, :destroy]

    # GET /apiv1/items
    # GET /apiv1/items.json
    def index
      @items = Item.all(:name) 
      render :json => @items   #Using Item serializer by default
    end

    # GET /apiv1/items/1
    # GET /apiv1/items/1.json
    def show
      render :json => Item.find(params[:id])
    end

    def create
      @item = Item.new(item_params)

      if @item.save        
        render :json => { status: :created, item: @item }
      else
        render :json => { errors: @item.errors, status: :unprocessable_entity }
      end
    end

    def update
      puts "item::update (params): "  + item_params.inspect
    
      if @item.update(item_params)
        render :json => {status: :ok, item: @item }
      else
        render :json => {errors: @item.errors, status: :unprocessable_entity }
      end
    end

    # DELETE /apiv1/items/1
    # DELETE /apiv1/items/1.json
    def destroy
      @item.destroy
      render :json => { status: :deleted, head: :no_content }
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item
        @item = Item.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def item_params
        params.require(:items).permit(:id, :name, :image_url,:description)
      end



	end
end
