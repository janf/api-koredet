require 'rails_helper'

#RSpec.describe Item, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

describe Item, type: :model do


	describe "Item model" do

		before(:all) do
			@account = FactoryBot.create(:account)
			puts "Creating account, ID: " + @account.id.to_s
		end

		after(:all) do
			if @account
				@account.delete
			end
			puts "Deleted item and account test data"
		end

		it "It creates an item" do
			@item = FactoryBot.create(:item, account: @account)
			#item = FactoryBot.create(:item)
			puts "Creating new item, ID: " + @item.id.to_s + " Account: " + @item.account_id.to_s
			expect(@item.id).to_not be_nil
			@item.delete
		end

		it "It saves an item with new name" do
			@item2 = FactoryBot.create(:item, account: @account)
			@item2.name = "New name"
			expect(@item2.save).to_not be_nil
			@item2.delete
		end


	end


end
