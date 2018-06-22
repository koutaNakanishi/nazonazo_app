class Nazo < ApplicationRecord
  belongs_to :user
	has_many :likes,dependent: :destroy

	def like_user(user_id)
#		debugger
		likes.find_by(user_id: user_id)
	end

	default_scope -> {order(created_at: :desc)}
	#時間順で並び替え
	validates :user_id,presence:true
	validates :content,presence:true,length:{maximum: 200}
	validates :answer,presence:true
	validates :difficulty,presence:true


end
