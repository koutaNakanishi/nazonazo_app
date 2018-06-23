class StaticPagesController < ApplicationController
  def home
		if logged_in?
			@nazo=current_user.nazos.build
			@feed_items=current_user.feed.paginate(page: params[:page])
		end
  end

	def fave
		if logged_in?
			@nazo=current_user.nazos.build
			@feed_items=current_user.feed_fave.paginate(page: params[:page])
		end
		render 'home'
	end

	def myfave
		if logged_in?
			@nazo=current_user.nazos.build
			@feed_items=(current_user).paginate(page: params[:page])
			#@feed_imtes=[]
		end
		render 'home'
	end	


  def help
  end

	def about
	end

	def  contact
	end

	def mypage
	end

#hello
end
