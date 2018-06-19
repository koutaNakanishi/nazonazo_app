require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

	test "layout links" do
		get root_path
	assert_template 'static_pages/home'
		assert_select "a[href=?]", root_path
		assert_select "a[href=?]",help_path
		assert_select "a[href=?]",about_path
		assert_select "a[href=?]",contact_path
		assert_select "a[href=?]",signup_path

		#ヘルパーの動作確認,full_titleヘルパーの確認
		get help_path
		assert_select "title",full_title("Help")
	end
end
