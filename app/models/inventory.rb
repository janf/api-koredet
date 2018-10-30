class Inventory < ApplicationRecord

  	acts_as_tenant(:account)

    belongs_to :item
    belongs_to :location

end
