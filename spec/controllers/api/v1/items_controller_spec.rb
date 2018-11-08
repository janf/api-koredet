require 'rails_helper'

describe Api::V1::ItemsController do

	# #def setup_user
	# 	@user = FactoryBot.create(:user, email: Time.now.getutc.to_i.to_s + "@example.com" )
	# 	puts  "User id: " + @user.id.to_s
	# 	puts "Name: " + @user.name
	# 	puts "Account: " + @user.current_account_id.to_s
	# 	auth_headers = @user.create_new_auth_token
	# 	puts "Headers: " + auth_headers.to_s
	# 	request.headers.merge!(auth_headers)
	# end

  before(:all) do
		@user = FactoryBot.create(:user, email: (Time.now.getutc.to_f*10000).to_i.to_s + "@example.com" )
		puts  "User id: " + @user.id.to_s
		puts "Name: " + @user.name
		puts "Account: " + @user.current_account_id.to_s
		#auth_headers = @user.create_new_auth_token
		#puts "Headers: " + auth_headers.to_s
		#request.headers.merge!(auth_headers)
		#puts "Setting up user"
  end

	after(:all) do
		@user.current_account.delete
		@user.delete
    puts "Cleaning up user"
	end



	describe "Create and query item" do
	    # before(:each) do
	    #   #setup_user
	    #   @item = FactoryBot.create( :item, account_id: @user.current_account_id)
			# 	@item.save
			# 	puts "Setting up test data, item ID: " + @item.id.to_s
	    # end
			#
			# after(:each) do
			# 	#@item.delete
			# 	#@user.current_account.delete
			# 	#@user.delete
			# 	puts "Deleted test data"
			# end

			#let (:id) { @id }

			before(:each) do
				auth_headers = @user.create_new_auth_token
				puts "Headers: " + auth_headers.to_s
				request.headers.merge!(auth_headers)
				#puts "Setting up user"
			end

			it 'responds with 200 status code when creating item' do
				#auth_headers = @user.create_new_auth_token
				#puts "Headers: " + auth_headers.to_s
				#request.headers.merge!(auth_headers)
				#puts "Setting up headers"
	      post :create, params: { items: {name: "My Test Item" }}
				expect(response.code).to eq('200')
				MyResp = JSON.parse(response.body)
				puts "MyResp : " + MyResp.to_s
				MyItem =  MyResp["item"]
				puts "MyItem : " + MyItem.to_s
				puts "MyItem ID: " + MyItem["id"].to_s
				@id = MyItem["id"]

				Item.find(@id).destroy
				#puts "ID: " + MyHash.item.id.to_s
	    end


	    it 'responds with 200 status code when showing item' do
				#auth_headers = @user.create_new_auth_token
				#puts "Headers: " + auth_headers.to_s
				#request.headers.merge!(auth_headers)
				#puts "Setting up user"
				@item = Item.new
				@item.name = "Show test item"
				@item.description = "Not much"
				@item.account_id = @user.current_account.id
				@item.save
				puts "Item id: " + @item.id.to_s
				#sleep(2)
				get :show, params: { id: @item.id }
	      expect(response.code).to eq('200')
				@item.delete
	    end
	end

    # describe "POST #create" do
    # 	#before(:each) do
	  #   #  @user = FactoryBot.create :user
	  #   #  auth_headers = @user.create_new_auth_token
	  #   #  request.headers.merge!(auth_headers)
	  #   #end
	  #   before (:each) do
	  #   	#setup_user
		#
	  #   end
		#
		# 	after(:each) do
		# 		Item.where(name: "My Test Item" ).destroy_all
		# 		#@user.current_account.delete
		# 		#@user.delete
		# 	end
		#
		#
	  #   it 'responds with 200 status code' do
		# 		#auth_headers = @user.create_new_auth_token
		# 		#puts "Headers: " + auth_headers.to_s
		# 		#request.headers.merge!(auth_headers)
		# 		#puts "Setting up headers"
	  #     post :create, params: { items: {name: "My Test Item" }}
		# 		expect(response.code).to eq('200')
		# 		MyResp = JSON.parse(response.body)
		# 		puts "MyResp : " + MyResp.to_s
		# 		MyItem =  MyResp["item"]
		# 		puts "MyItem : " + MyItem.to_s
		# 		puts "MyItem ID: " + MyItem["id"].to_s
		#
		# 		#puts "ID: " + MyHash.item.id.to_s
	  #   end
  	# end

end
