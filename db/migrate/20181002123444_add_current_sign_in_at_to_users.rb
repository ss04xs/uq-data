class AddCurrentSignInAtToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :sign_in_count, :int
  end
end
