require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	def setup
		@user=User.new(name:" Example User",login_id:"user@example.com",password:"foobar",password_confirmation:"foobar")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name=" "
		assert_not @user.valid?
	end

	test "login_id should be present"do
		@user.login_id=" "
		assert_not @user.valid?
	end

	test "name should not be too long"do
		@user.name="a"*51
		assert_not @user.valid?
	end
		
#	test "login_id should not be too long"do
#		@user.login_id="a"*244+"@example.com"
#		assert_not @user.valid?
#		end
#
#		test "login_id validation should accept valid addresses" do
#			valid_adresses=%w[user@example.com USER@foo.COM A_US_ER@foo.bar.org first.last@foo.jp
#			 alice+bob@baz.cn]
#			
#			valid_adresses.each do |valid_adress|
#				@user.login_id=valid_adress
#				assert @user.valid?,"#{valid_adress.inspect} should be valid"
#			end	 
#		end 
#
#
#		test "login_id invalidation should reject invalid addresses" do
#			invalid_adresses=%w[foo@bar..com user@example_com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
#			
#				invalid_adresses.each do |invalid_adress|
#				@user.login_id=invalid_adress
#				assert_not @user.valid?,"#{invalid_adress.inspect} should be invalid"
#			end	 
#		end 
#
##	test "login_id addresses should be unique" do
##		duplicate_user=@user.dup
##		duplicate_user.login_id=@user.login_id.upcase
#		@user.save
#		assert_not duplicate_user.valid?
#	end
#
#	test "login_id address should be saved as lower-case" do
#		mixed_case_login_id="FooExAMPLECom"
#		@user.login_id=mixed_case_email
#		@user.save
#		assert  mixed_case_login_id.downcase==@user.reload.login_id
#	end
#
	test "password should be present (nonblank)" do
		@user.password=@user.password_confirmation=" "*6
		assert_not @user.valid?
	end

	test "password should have a minimum length" do
		@user.password=@user.password_confirmation="a"*5
		assert_not @user.valid?
	end

end











