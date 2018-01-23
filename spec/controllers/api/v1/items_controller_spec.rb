require 'rails_helper'

describe Api::V1::ItemsController do

	def setup_user
  		@user = FactoryBot.create :user
	    auth_headers = @user.create_new_auth_token
	    request.headers.merge!(auth_headers)
	end

	describe "GET #show" do
	    before(:each) do
	      setup_user
	      @item = FactoryBot.create :item
	      get :show, params: { id: @item.id }
	    end

	    it 'responds with 200 status code' do
	      expect(response.code).to eq('200')
	    end
	end

    describe "POST #create with file attachment" do
    	#before(:each) do
	    #  @user = FactoryBot.create :user
	    #  auth_headers = @user.create_new_auth_token
	    #  request.headers.merge!(auth_headers)
	    #end
	    before (:each) do
	    	setup_user
	    	post :create, params: { items: {name: "My Item" }}
	    end

	    it 'responds with 200 status code' do
	      expect(response.code).to eq('200')
	    end
  	end

end
