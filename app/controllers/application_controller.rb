class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	include SessionsHelper#せしょんの実装をコントローラやビューにいっぱい書く必要がある
#それをincludeする:

		def	logged_in_user
			unless logged_in?
				store_location#getでアクセスしようとしたアドレスを記憶
#				debugger
				flash[:danger]="まずはログインしてね"
				redirect_to login_url
			end
		end

end
