require 'rails_helper'



describe Inventory, type: :model do

  #subject(:account) { FactoryBot.create :account}

  #subject(:item) { FactoryBot.create :item}

  #subject(:location) { FactoryBot.create :item}

  subject(:inventory) { FactoryBot.create :inventory}



	describe "Creation" do

		it "Gives inventory an id" do
			expect(inventory.qty).to_not be_nil
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
