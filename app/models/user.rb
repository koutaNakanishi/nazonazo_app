class User < ApplicationRecord

	has_many :nazos,dependent: :destroy
	has_many :likes,dependent: :destroy
	has_many :relationships,dependent: :destroy

	before_save{self.login_id.downcase!}
	validates:name,presence:true,length:{maximum:50}
	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates:login_id,presence:true,length:{maximum:255},uniqueness: true#,format:{with: VALID_EMAIL_REGEX},
	#メアドはいらないのん	

	
	# 関数password_digestにハッシュ化パスを保存できる
	#passwordとpassword_confirmationがつかえるようになる
	#authenticate 引数とパスワードが一致するとUserオブジェクトを、間違ってるとfalseを変える関数が使える
	has_secure_password
	validates :password, presence:true ,length: {minimum:6},allow_nil:true#空を許す。has_secure_passwordで
	#登録時は別のバリデーションが行われる
	
	def User.digest(string)#渡された文字列のハッシュ値を返す
		cost=ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string,cost: cost)
	end

	def feed
		Nazo.where("user_id not ?",nil).reorder("created_at DESC")
	end

	def feed_fave
		Nazo.where("user_id not?",nil).reorder(:good_num)
	end 

	def feed_myfave
#			Nazo.where("user_id IN (?) OR user_id= ?",likes.map(&:nazo_id),id)
	#		Nazo.where("id IN ?",likes.map(&:id))
			Nazo.where("id IN (?)",likes.map(&:nazo_id))
	end

	def feed_ac
			Nazo.where("id IN (?)",(relationships.select{|item| item.ac==true}).map(&:nazo_id))
	end

	def feed_wa
			Nazo.where("id IN (?)",(relationships.select{|item| item.ac==false}).map(&:nazo_id))
	end

end
