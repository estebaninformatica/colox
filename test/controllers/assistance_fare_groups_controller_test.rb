require 'test_helper'

class AssistanceFareGroupsControllerTest < ActionController::TestCase
  setup do
    @assistance_fare_group = assistance_fare_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assistance_fare_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assistance_fare_group" do
    assert_difference('AssistanceFareGroup.count') do
      post :create, assistance_fare_group: { name: @assistance_fare_group.name, operator_aptour_id: @assistance_fare_group.operator_aptour_id, provider_aptour_id: @assistance_fare_group.provider_aptour_id }
    end

    assert_redirected_to assistance_fare_group_path(assigns(:assistance_fare_group))
  end

  test "should show assistance_fare_group" do
    get :show, id: @assistance_fare_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assistance_fare_group
    assert_response :success
  end

  test "should update assistance_fare_group" do
    patch :update, id: @assistance_fare_group, assistance_fare_group: { name: @assistance_fare_group.name, operator_aptour_id: @assistance_fare_group.operator_aptour_id, provider_aptour_id: @assistance_fare_group.provider_aptour_id }
    assert_redirected_to assistance_fare_group_path(assigns(:assistance_fare_group))
  end

  test "should destroy assistance_fare_group" do
    assert_difference('AssistanceFareGroup.count', -1) do
      delete :destroy, id: @assistance_fare_group
    end

    assert_redirected_to assistance_fare_groups_path
  end
end
