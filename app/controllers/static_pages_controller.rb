class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

	def about
	end

	def  contact
	end

	def mypage
		if logged_in?
			@nazo=current_user.nazos.build
			@feed_items=current_user.feed.paginate(page: params[:page])
		end
		render 'mypage'
	end

#hello
end
