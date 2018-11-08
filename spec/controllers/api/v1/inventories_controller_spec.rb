require 'rails_helper'

describe Api::V1::InventoriesController do



	describe "GET #show" do


	    before(:all) do
				@user = FactoryBot.create(:user, email: (Time.now.getutc.to_f*10000).to_i.to_s + "@example.com" )
				puts  "User id: " + @user.id.to_s
				puts "Name" + @user.name
				puts "Account" + @user.current_account_id.to_s
	    end

			after(:all) do
				#@user.current_account.delete
				#@user.delete
				puts "Deleted test data"
			end


	    it 'responds with 200 status code' do
				@account = @user.current_account
				@item = FactoryBot.create(:item, account: @account)
				@location = FactoryBot.create(:location, account: @account)
				@inventory = FactoryBot.create(:inventory, account: @account, item: @item, location: @location )
				puts "Created inventory test data"
				puts "Inv ID: " + @inventory.id.to_s
				puts "Item ID: " + @item.id.to_s
				puts "Location: " + @location.id.to_s
				puts "Id: " + @inventory.id.to_s
				puts "Location: " + @inventory.location.location_name
				puts "Account: " + @inventory.account_id.to_s
				puts "Created test data"
				auth_headers = @user.create_new_auth_token
				puts "Headers: " + auth_headers.to_s
		    request.headers.merge!(auth_headers)
				get :show, params: { id: @inventory.id }
	      expect(response.code).to eq('200')
				@inventory.delete
				@item.delete
				@location.delete

	    end
	end


end
