class UsersController < ApplicationController
	before_action :logged_in_user,only:[:index,:edit,:update, :destroy]
	before_action :correct_user,only:[:edit,:update]
	before_action :admin_user, only:[:destroy]
#editとupdateに制限をかける（指定しないと全部に制限がかかる) 
	
  def new
		@user=User.new
	#	debugger
  end
	
	def create
	#	@user=User.new(params[:user])丸々paramsのhashを渡すのは良くない
		@user=User.new(user_params)
		if@user.save
			log_in @user
			flash[:success]="Welcome to the Sample App! 登録完了"
			#初めは登録完了ページを出したい
			redirect_to @user
			#作成されたゆーざぺーじにとぶ /users/3など
		else 
			render 'new'
		end
	end

	def show
		@user=User.find(params[:id])

	end

	def edit
		@user=User.find(params[:id])
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success]="User deleted"
		redirect_to users_url
	end

	def index
	#	@users=User.all
		@users=User.paginate(page:params[:page])#いい感じにユーザを小分けにとってくれる	
	end

	def update

		@user=User.find(params[:id])
		if @user.update_attributes(user_params)#user_paramsを引数に更新出来たら
			flash[:success]="Profile updated"
			redirect_to @user
		else 
			render 'edit'
		end
	end


	private#ネットワーク経由で実行できない（攻撃される危険性が少ない？）ヘルパー
		def user_params

			params.require(:user).permit(:name,:email,:password,:password_confirmation)
		end 
		#beforeアクション
		def	logged_in_user
			unless logged_in?
				store_location#getでアクセスしようとしたアドレスを記憶
#				debugger
				flash[:danger]="Please log in."
				redirect_to login_url
			end
		end


		def correct_user
			@user=User.find(params[:id])
			redirect_to(root_url)unless current_user?(@user)
			end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
end







