class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def send_massege
    user = User.find_by_address(params[:address])
    require 'net/https'
	require 'json'
  	me = params[:message]
  	logger.debug params[:address]
  	uri = URI.parse("https://api.chatwork.com/v2/rooms/#{user.room_id}/messages")
	request = Net::HTTP::Post.new(uri)
	request["X-Chatworktoken"] = user.chatwork_token
	request.set_form_data(
	  "body" => me,
	  "self_unread" => "0",
	)

	req_options = {
	  use_ssl: uri.scheme == "https",
	}

	logger.debug user.chatwork_token

	response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
	  http.request(request)
	end
	render :status => 200, :json => {:message => "送信成功しました。"}
  end

  def chatwork_me
  	require 'net/https'
	require 'json'
  	user = User.find(params[:id])
  	me = params[:me]
  	logger.debug params[:id]
  	uri = URI.parse("https://api.chatwork.com/v2/rooms/#{user.room_id}/messages")
	request = Net::HTTP::Post.new(uri)
	request["X-Chatworktoken"] = user.chatwork_token
	request.set_form_data(
	  "body" => me,
	  "self_unread" => "0",
	)

	req_options = {
	  use_ssl: uri.scheme == "https",
	}

	logger.debug user.chatwork_token

	response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
	  http.request(request)
	end
	render :status => 200, :json => {:message => "送信成功しました。"}
  end
end