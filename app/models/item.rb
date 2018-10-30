class Item < ApplicationRecord
   acts_as_tenant(:account)
   has_many :inventories
	# has_one_attached :item_image   #wait until v5.2
end
