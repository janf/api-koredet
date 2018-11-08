require 'rails_helper'



describe Inventory, type: :model do

  #subject(:account) { FactoryBot.create :account}

  #subject(:item) { FactoryBot.create :item}

  #subject(:inventory) { FactoryBot.create :inventory}

	describe "Creation" do

    before(:each) do
      @account = FactoryBot.create :account
      @item = FactoryBot.create(:item, account_id: @account.id)
      @location = FactoryBot.create(:location, account_id: @account.id)
      @inventory = FactoryBot.create(:inventory, account_id: @account.id, item_id: @item.id, location_id: @location.id )
      puts "Created inventory test data"
      puts "Inv ID: " + @inventory.id.to_s
      puts "Item ID: " + @item.id.to_s
      puts "Location: " + @location.id.to_s
    end

    after(:each) do

      @inventory.delete
      @item.delete
      @location.delete
      @account.delete
      puts "Deleted inventory test data"
    end

		it "Gives inventory an id" do
      puts "Inventory qty:" + @inventory.qty.to_s
			expect(@inventory.qty).to_not be_nil
		end


	    #it 'Accepts attachments' do
		#    item.item_image.attach(io: File.open("/home/janfh/Pictures/test1.jpg"), filename: "test1.jpg", content_type: "image/jpg")
		#    expect(item.item_image.attached?).to eq(true)
	    #end

	    #it 'Detaches attachments' do
	    #	item.name = "Name changed"
	    #	item.item_image.attach(io: File.open("/home/janfh/Pictures/test1.jpg"), filename: "test1.jpg", content_type: "image/jpg")
	    #	expect(item.item_image.attached?).to eq(true)
	    #	item.item_image.purge
	    #	expect(item.item_image.attached?).to eq(false)
	    #end
	end


end
