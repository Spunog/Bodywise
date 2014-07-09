require 'test_helper'

class MemberControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile, {:username => 'spunog'}
    assert_response :success
  end
end