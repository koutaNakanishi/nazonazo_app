class SessionsController < ApplicationController
  def new
  end
	
	def create 
		user=User.find_by(login_id:params[:session][:login_id].downcase)
		if user && user.authenticate(params[:session][:password])
			#ユーザログイン後にユーザ情報のページにリダイレクト

			log_in user
			redirect_back_or "friend",user
			#redirect_to user_url(user)
		else 
			#エラーメッセージの作成
			flash.now[:danger]='IDかパスワードがちがうよ'
			render 'new'
		end
	end


	def destroy
		log_out
		redirect_to root_url
	end

end
