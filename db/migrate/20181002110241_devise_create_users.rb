# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.varchar :current_sign_in_ip
      t.varchar :last_sign_in_ip
      t.int :sign_in_count

      t.string :users, :username
      t.text :users, :adress
      t.text :users, :chatwork_token
      t.string :users, :provider
      t.string :users, :uid
      t.string :users, :token
      t.string :users, :meta


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
