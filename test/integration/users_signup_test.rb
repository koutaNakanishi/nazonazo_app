require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

	test "invalid signup information" do
		get signup_path#sign_uppathにgetリクエスト
		assert_no_difference 'User.count' do
			post signup_path,params:{user:{
					name:"",
					email:"user@invalid",
					password:"foo",
					password_confirmation:"bar"}}
		end
		assert_template 'users/new'#登録に失敗していたら/newが描画されるはず
		assert_select "li","Name can't be blank"
		assert_select "li","Email is invalid"
		#passwordに関するテストが正常に動作しない。なぜだ？	
	end

	test "valid signup information" do
		get signup_path
		assert_difference 'User.count',1 do #User.countとdoした後の結果を比較する。カウントがプラス1ならok
			post users_path,params:{user:{
				name:"Example User",
				email:"user@example.com",
				password:"password",
				password_confirmation:"password"
			}}
		end
		follow_redirect!#ひとつ後にリダイレクト
		assert_template 'users/show' #今のURLはusers/showのはず
		assert_not flash[:success].blank?
		assert is_logged_in?
	end

end



