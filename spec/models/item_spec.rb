require 'rails_helper'

#RSpec.describe Item, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

describe Item, type: :model do

	subject(:item) { FactoryBot.create :item}



	describe "Creation" do

		it "Gives item an id" do
			expect(item.id).to_not be_nil 
		end	


	    it 'Accepts attachments' do
		    item.item_image.attach(io: File.open("/home/janfh/Pictures/test1.jpg"), filename: "test1.jpg", content_type: "image/jpg")
		    expect(item.item_image.attached?).to eq(true)
	    end

	    it 'Detaches attachments' do
	    	item.name = "Name changed"
	    	item.item_image.attach(io: File.open("/home/janfh/Pictures/test1.jpg"), filename: "test1.jpg", content_type: "image/jpg")
	    	expect(item.item_image.attached?).to eq(true)
	    	item.item_image.purge
	    	expect(item.item_image.attached?).to eq(false)
	    end
	end


end




