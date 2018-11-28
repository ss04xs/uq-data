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
  	amount = params[:amount]
  	date = params[:date]
  	#有給時間の計算
    uq_x = amount.to_i / 800.to_f
    uq_fract_m = uq_x * 10 % 10 /10
    uq_fract_m2 = (uq_fract_m * 800 / 100.to_f) * 10 % 10 /10.to_f
    uq_fract_m3 = (uq_fract_m2 * 100).to_s.split(".")[0]
    uq_day = uq_x.to_s.split(".")[0]+"日"
    uq_hours = (uq_fract_m * 800 / 100.to_f).to_s.split(".")[0]+"時間"
    uq_minutes = (uq_fract_m3.to_f/100 * 60).to_s.split(".")[0]+"分"
  	me_format = "[info][title]有給申請[/title]日時: #{date}  #{uq_day unless uq_day == "0日"}#{uq_hours unless uq_hours == "0時間"}#{uq_minutes unless uq_minutes == "0分"}間\n送金:#{amount} soda　送金日時:x月x日x時[/info] #{me}"
  	logger.debug params[:address]
  	uri = URI.parse("https://api.chatwork.com/v2/rooms/#{user.room_id}/messages")
	request = Net::HTTP::Post.new(uri)
	request["X-Chatworktoken"] = user.chatwork_token
	request.set_form_data(
	  "body" => me_format,
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