class RenameAdressColumnToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :adress, :address
  end
end
