class SessionsController < Devise::SessionsController
	# ログアウト
	def destroy
		super
		#サーバー側で保持しているログイン情報をログアウト状態に切り替え。
		session[:keep_signed_out] = true
	end
end
