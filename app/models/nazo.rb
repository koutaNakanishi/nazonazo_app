class Nazo < ApplicationRecord
  belongs_to :user
	default_scope -> {order(created_at: :desc)}
	#時間順で並び替え
	validates :user_id,presence:true
	validates :content,presence:true,length:{maximum: 200}
	validates :answer,presence:true
	validates :difficulty,presence:true
end
