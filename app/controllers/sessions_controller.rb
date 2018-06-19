class SessionsController < ApplicationController
  def new
  end
	
	def create 
		user=User.find_by(email:params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#ユーザログイン後にユーザ情報のページにリダイレクト

			log_in user
			redirect_back_or user
			#redirect_to user_url(user)
		else 
			#エラーメッセージの作成
			flash.now[:danger]='Inavlid email/password combination'
			render 'new'
		end
	end


	def destroy
		log_out
		redirect_to root_url
	end

end
