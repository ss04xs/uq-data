class Users::UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	
  end

  def wallet_create
  	if current_user
		  @user = User.find_by_id(current_user)
	  end
  end

end