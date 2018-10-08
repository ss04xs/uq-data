class AddAddDefaultUserToUsers < ActiveRecord::Migration
  def change
  	change_column_default :users, :username, ""
  	change_column_default :users, :adress, ""
  	change_column_default :users, :chatwork_token, ""
  end
end
