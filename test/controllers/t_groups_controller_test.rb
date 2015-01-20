require 'test_helper'

class TGroupsControllerTest < ActionController::TestCase
  setup do
    @t_group = t_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:t_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create t_group" do
    assert_difference('TGroup.count') do
      post :create, t_group: { name: @t_group.name, operator_aptour_id: @t_group.operator_aptour_id, provider_aptour_id: @t_group.provider_aptour_id }
    end

    assert_redirected_to t_group_path(assigns(:t_group))
  end

  test "should show t_group" do
    get :show, id: @t_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @t_group
    assert_response :success
  end

  test "should update t_group" do
    patch :update, id: @t_group, t_group: { name: @t_group.name, operator_aptour_id: @t_group.operator_aptour_id, provider_aptour_id: @t_group.provider_aptour_id }
    assert_redirected_to t_group_path(assigns(:t_group))
  end

  test "should destroy t_group" do
    assert_difference('TGroup.count', -1) do
      delete :destroy, id: @t_group
    end

    assert_redirected_to t_groups_path
  end
end
