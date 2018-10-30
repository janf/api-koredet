class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.references :account, foreign_key: true
      t.references :item, foreign_key: true
      t.references :location, foreign_key: true
      t.integer :qty
      t.timestamps
    end
  end
end
