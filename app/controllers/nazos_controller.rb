class NazosController < ApplicationController
	before_action :logged_in_user, only:[:new,:create,:destroy]
	def create
		@nazo=current_user.nazos.build(nazo_params)
#		debugger
		if @nazo.save
				#@nazo.update(fight_num:0)
				#@nazo.update(solved_num:0)
				flash[:success]="なぞなぞを投稿しました!"
				redirect_to root_url
		else 

			render 'new'
		end

	end

	def destroy

	end

	def show
		@nazo=Nazo.find(params[:id])
		@user=User.find(@nazo.user_id)
		store_location "replay"
	end
	
	def new 
		@nazo=current_user.nazos.build if logged_in?
		render 'new'
	end

	def getans #showのページから回答を受け取る
				@ans=params[:form][:ans]
				@nazo=Nazo.find(params[:id])
				#@user=User.find(@nazo.user_id)
				@correct_ans=@nazo.answer
				@post_user=User.find(@nazo.user_id)
				#debugger

				###以下回答が来た時の処理

		#		relation=@user.relationships#過去に解いたことがあるか
				res=current_user.relationships.find_by(nazo_id:@nazo.id)
				current_user.update(fighted_num:current_user.fighted_num+1)

				@nazo.update(fight_num:(@nazo.fight_num+1))#挑戦人数を一人追加
				@post_user.update(fighted_num:@post_user.fighted_num+1)
				#debugger
				if @ans.to_s==@correct_ans then#ac
				#	debugger
					if res.nil? then 
						 current_user.relationships.create(nazo_id: @nazo.id,ac: true) #初挑戦				
						 @nazo.update(solved_num:@nazo.solved_num+1)#解いた人数を一人追加	
						 @post_user.update(solved_num:@post_user.solved_num+1)#userのほうもsolved_numを1追加
				elsif res.ac==false then #waなら上書き
							res.update(nazo_id: @nazo.id,ac: true)
						 @nazo.update(solved_num:@nazo.solved_num+1)#解いた人数を一人追加
						 @post_user.update(solved_num:@post_user.solved_num+1)#userのほうもsolved_numを1追加
					end

				else#WA 
					if res.nil? then
						 current_user.relationships.create(nazo_id: @nazo.id,ac: false) #初挑戦				
					end
				end

				render 'result' #答えをもとに、正解or間違いを表示するページ
	end

	def replay
		#debugger
		redirect_back_or "replay",home_path
	end

	def nazo_index
		#debugger
		redirect_back_or "nazo_index",home_path
	end

	private 

	def nazo_params
		params.require(:nazo).permit(:content,:answer,:difficulty,:fight_num,:solved_num)
	end



end








