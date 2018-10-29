require 'rails_helper'

describe Api::V1::LocationsController do

	def setup_user
  		@user = FactoryBot.create :user
	    auth_headers = @user.create_new_auth_token
	    request.headers.merge!(auth_headers)
	end

	describe "GET #show" do
	    before(:each) do
	      setup_user
	      @location = FactoryBot.create :location
	      get :show, params: { id: @location.id }
	    end

	    it 'responds with 200 status code' do
	      expect(response.code).to eq('200')
	    end
	end


end
