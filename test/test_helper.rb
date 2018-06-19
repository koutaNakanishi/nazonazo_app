require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

	include ApplicationHelper

	def log_in_as(user)
		#debugger
		#get login_path
#		post params: {user: {name: user.name , email: user.email , password: "password" ,  password_confirmation: "password"}}
		session[:user_id] = user.id
	end

	def is_logged_in?
	#	debugger
		!session[:user_id].nil?
	#	session[:user_id]
	end


end
