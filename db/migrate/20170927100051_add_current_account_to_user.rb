class AddCurrentAccountToUser < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :current_account, references: :accounts
  end
end
