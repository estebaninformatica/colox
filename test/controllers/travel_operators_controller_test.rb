require 'test_helper'

class TravelOperatorsControllerTest < ActionController::TestCase
  setup do
    @travel_operator = travel_operators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_operators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_operator" do
    assert_difference('TravelOperator.count') do
      post :create, travel_operator: { name: @travel_operator.name, operator_aptour_id: @travel_operator.operator_aptour_id }
    end

    assert_redirected_to travel_operator_path(assigns(:travel_operator))
  end

  test "should show travel_operator" do
    get :show, id: @travel_operator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_operator
    assert_response :success
  end

  test "should update travel_operator" do
    patch :update, id: @travel_operator, travel_operator: { name: @travel_operator.name, operator_aptour_id: @travel_operator.operator_aptour_id }
    assert_redirected_to travel_operator_path(assigns(:travel_operator))
  end

  test "should destroy travel_operator" do
    assert_difference('TravelOperator.count', -1) do
      delete :destroy, id: @travel_operator
    end

    assert_redirected_to travel_operators_path
  end
end
