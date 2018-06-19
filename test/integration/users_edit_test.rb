require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

	def setup
		@user=users(:michael)
	end

	test "unsuccessful edit" do
	
 # 	get login_path
		post login_path,params:{session: {email: @user.email,password:'password'} }
		
	 	log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user),params: {user: {
																				name: "",email: "foo@invalid", password: "foo",
																				password_confirmation:"bar"}}
		assert_template 'users/edit'
	end

	test "successful edit" do
		
		post login_path,params:{session: {email: @user.email,password:'password'} }
		log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		name="Foo bar"
		email="foo@bar.com"
		patch user_path(@user),params:{user: {name: name,
																	email:email,password:"",password_confirmation:""}}
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal name,@user.name
		assert_equal email,@user.email

	end

	test "successful edit with friendly forwarding" do
		get edit_user_path(@user)
	post login_path,params:{session: {email: @user.email,password:'password'} }
		log_in_as(@user)
#		debugger
#		follow_redirect!
		assert_redirected_to edit_user_url(@user)
		name="Foo Bar"
		email="foo@bar.com"

		patch user_path(@user),params:{user: {name: name,
																	email: email,password: "",password_confirmation: ""}}

		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal name,@user.name
		assert_equal email,@user.email
	end

	test "do friendlly fowarding and next will redirect to profile " do#このテストは未完成です:
		get edit_user_path(@user)
		post login_path,params:{session: {email: @user.email,password:'password'} }
		log_in_as(@user)
		assert_not  session[:fowarding_url].nil?
		assert_redirected_to edit_user_url(@user)

		patch user_path(@user),params:{user: {name: @user.name,
																	email: @user.email,password:"",password_confirmation:""}}

		#assert sessin[:fowarding_url].nil?
		assert_not flash.empty?
		assert_redirected_to @user
	end

end




