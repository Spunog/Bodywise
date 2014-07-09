require 'test_helper'

class WeightsControllerTest < ActionController::TestCase
  setup do
    @weight = weights(:one)
    @user = users(:one)
    sign_in @user 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weight" do
    assert_difference('Weight.count') do
      #date weighted below needs to be different that fixture data as has unique constraint on user + date
      post :create, weight: { date_weighted: '2014-10-01', weight_lbs: @weight.weight_lbs, share_category_id: @weight.share_category_id, note: @weight.note }
    end

    assert_redirected_to :weights
  end

  test "should show weight" do
    get :show, id: @weight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weight
    assert_response :success
  end

  test "should update weight" do
    patch :update, id: @weight, weight: { date_weighted: @weight.date_weighted, weight_lbs: @weight.weight_lbs }
    assert_redirected_to :weights
  end

  test "should destroy weight" do
    assert_difference('Weight.count', -1) do
      delete :destroy, id: @weight
    end

    assert_redirected_to weights_path
  end
end
