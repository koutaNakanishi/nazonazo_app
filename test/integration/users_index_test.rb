require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

	def setup
		@user=users(:michael)
		@non_admin=users(:archer)
	end

	test "index including pagination" do
		
#		get login_path
		post login_path , params: {session: {name: @user.name , email: @user.email , password: "password" ,  password_confirmation: "password"}}
		log_in_as(@user)
		get users_path
		assert_template 'users/index'
		assert_select 'div.pagination'
		User.paginate(page: 1).each do |user|
			assert_select 'a[href=?]',user_path(user),text:user.name	
		end
	end

	test "index as admin including pagination and delete links" do
		post login_path , params: {session: {name: @user.name , email: @user.email , password: "password" ,  password_confirmation: "password"}}
		log_in_as(@user)
		get users_path
		assert_template 'users/index'
		assert_select 'div.pagination' #paginatonされてるか
		first_page_of_users=User.paginate(page:1)
		first_page_of_users.each do |user|
			assert_select 'a[href=?]',user_path(user), text: user.name #usernameが出てるか
			unless user.admin
				assert_select 'a[href=?]',user_path(user),text: 'delete' #adminでなければdeleteが出てるか
			end
		end

			assert_difference 'User.count',-1 do
				delete user_path(@non_admin)
			end
		end

		test "index as non-admin" do
			post login_path , params: {session: {name: @non_admin.name , email: @non_admin.email , password: "password" ,  password_confirmation: "password"}}
			log_in_as(@non_admin)
			get users_path
			assert_select 'a',text:'delete',count:0
		end

end
