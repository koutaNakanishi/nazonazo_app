require 'test_helper'

class NazoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	def setup
		@user=users(:michael)
		@nazo=@user.nazos.build(content: "パンはパンでも食べられないパンは？",answer: "ふらいぱん")
	end


  test "should be valid" do
    assert @nazo.valid?
  end

  test "user id should be present" do
    @nazo.user_id = nil
    assert_not @nazo.valid?
  end

  test "content should be present" do
    @nazo.content = "   "
    assert_not @nazo.valid?
  end

  test "content should be at most 200 characters" do
    @nazo.content = "a" * 201
    assert_not @nazo.valid?
  end 

end
