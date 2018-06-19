require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

	def setup
		@user=users(:michael)
	end
	test "login with valid information followed by logout" do
		get login_path
		post login_path,params:{session: {email: @user.email,password:'password'} }
		assert is_logged_in?
		assert_redirected_to @user#ユーザページに飛んだか
		follow_redirect!#実際↑に従って飛ぶ
		assert_template 'users/show' #usersのshowがちゃんと呼ばれているか
		assert_select "a[href=?]",login_path,count:0
		assert_select "a[href=?]",logout_path# a href= logout_path　なはず..
		assert_select "a[href=?]",user_path(@user)
		delete logout_path
		assert_not is_logged_in?
		assert_redirected_to root_url
		follow_redirect!
		assert_select "a[href=?]",login_path
		assert_select "a[href=?]",logout_path,count:0
		assert_select "a[href=?]",user_path(@user),count:0
	end

	test "login with invalid information" do
		get login_path#/login
		assert_template 'sessions/new'#sessions/newにいるか確認(フォームがある所)
		post login_path params:{session: {email: "",password: ""} }#ポストする(create)
		assert_template 'sessions/new'#sessions/newにいるか確認
		assert_not flash.empty?#flashが空ならエラー
		get root_path#/へ移動
		assert flash.empty?#flashが空でないならエラー
	end
end
