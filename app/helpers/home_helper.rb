module HomeHelper
	def user_hash
		user_all = User.all
		user_h = user_all.map {|user| [user.address.to_s, user.username] }.to_h.to_json.html_safe
		return user_h
	end
end
