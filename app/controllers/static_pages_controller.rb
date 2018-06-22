class StaticPagesController < ApplicationController
  def home
		if logged_in?
			@nazo=current_user.nazos.build

			@feed_items=(current_user.feed.order :good_num).paginate(page: params[:page])
		end
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
