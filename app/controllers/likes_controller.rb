class LikesController < ApplicationController
	def create
		@like=Like.create(user_id: current_user.id,nazo_id: params[:nazo_id])
		@likes=Like.where(nazo_id: params[:nazo_id])
		@nazos=Nazo.all
	end

	def destroy
		like=Like.find_by(user_id: current_user.id,nazo_id: params[:nazo_id])
		like.destroy
		@likes=like.where(nazo_id: params[:nazo_id])
		@nazos=Nazo.all
	end

end
