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
			@feed_items=current_user.feed_myfave.paginate(page: params[:page])
		#	@feed_items=[]
		#	@feed_items=[] if @feed_items.nil?
		end
		render 'home'
	end	

	def ac
			@nazo=current_user.nazos.build
			@feed_items=current_user.feed_ac.paginate(page: params[:page])
		render 'home'
	end

	def wa
			@nazo=current_user.nazos.build
			@feed_items=current_user.feed_wa.paginate(page: params[:page])
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
