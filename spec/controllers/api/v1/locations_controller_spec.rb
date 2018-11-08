require 'rails_helper'

describe Api::V1::LocationsController do

	def setup_user
	  @user = FactoryBot.create(:user, email: (Time.now.getutc.to_f*10000).to_i.to_s + "@example.com" )
		puts "*** LOC ***"
		puts "User id: " + @user.id.to_s
		puts "Name: " + @user.name
		puts "Account: " + @user.current_account_id.to_s
		auth_headers = @user.create_new_auth_token
		puts "Headers: " + auth_headers.to_s
		request.headers.merge!(auth_headers)
	end

	describe "GET #show" do
	    before(:each) do
	      setup_user
	      @location = FactoryBot.create( :location, account: @user.current_account)
				puts "Created location ID: " + @location.id.to_s
	    end

			after(:each) do
			  @location.delete
				@user.current_account.delete
				@user.delete
			end

	    it 'responds with 200 status code' do
				get :show, params: { id: @location.id }
	      expect(response.code).to eq('200')
	    end
	end


end
