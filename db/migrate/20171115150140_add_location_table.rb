class AddLocationTable < ActiveRecord::Migration[5.1]
  def change
	create_table :locations do |t|
	  t.string :location_name, :null => false
	  t.string :location_type, default: "P"
	  t.string :ancestry
	  t.references :parent_id: locations, 
	  t.references :account, foreign_key: true
	  t.timestamps
	end
  end
end
