require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  setup do
    @goal = goals(:one)
    @user = users(:one)
    sign_in @user 
  end

  test "should get edit___________________!" do
    get :edit
    assert_response :success
  end

  test "should update goal" do
    patch :update, id: @goal, goal: { user_id: @goal.user_id, weight_lbs: @goal.weight_lbs }
    assert_redirected_to :goal
  end

end
