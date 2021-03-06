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

	validates :answer,presence:true,format:{with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}#ひらがなのみ
	validates :difficulty,presence:true,numericality:{only_integer: true,greater_than: 0,less_than: 11}


end
