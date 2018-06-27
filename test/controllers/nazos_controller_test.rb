require 'test_helper'

class NazosControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
	def setup
		@nazo=nazos(:one)
	end

	test "should redirect create when not logged in" do
		assert_no_difference'Nazo.count' do
			post nazos_path,params: {nazo: {content: "unchi", answer:"tintin" , difficulty: 1, good_num: 1,fight_num: 1,solved_num: 1} }
			end
			assert_redirected_to login_url
	end

	test "should redirect destroy when not logged in" do
		assert_no_difference 'Nazo.count' do
			delete nazo_path(@nazo)
		end
		assert_redirected_to login_url
	end

end
