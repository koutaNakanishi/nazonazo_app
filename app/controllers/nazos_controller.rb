class NazosController < ApplicationController
	before_action :logged_in_user, only:[:new,:create,:destroy]
	def create
		@nazo=current_user.nazos.build(nazo_params)
#		debugger
		if @nazo.save
				flash[:success]="なぞなぞを投稿しました!"
				redirect_to root_url
		else 

			render 'new'
		end

	end

	def destroy

	end
	
	def new 
		@nazo=current_user.nazos.build if logged_in?
		render 'new'
	end

	def nazo_params
		params.require(:nazo).permit(:content,:answer,:difficulty)
	end

end
