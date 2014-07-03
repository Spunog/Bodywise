require 'test_helper'

class MemberControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get weights" do
    get :weights
    assert_response :success
  end

end
