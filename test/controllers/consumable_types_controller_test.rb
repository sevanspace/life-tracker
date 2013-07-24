require 'test_helper'

class ConsumableTypesControllerTest < ActionController::TestCase
  setup do
    @consumable_type = consumable_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumable_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumable_type" do
    assert_difference('ConsumableType.count') do
      post :create, consumable_type: { name: @consumable_type.name }
    end

    assert_redirected_to consumable_type_path(assigns(:consumable_type))
  end

  test "should show consumable_type" do
    get :show, id: @consumable_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consumable_type
    assert_response :success
  end

  test "should update consumable_type" do
    patch :update, id: @consumable_type, consumable_type: { name: @consumable_type.name }
    assert_redirected_to consumable_type_path(assigns(:consumable_type))
  end

  test "should destroy consumable_type" do
    assert_difference('ConsumableType.count', -1) do
      delete :destroy, id: @consumable_type
    end

    assert_redirected_to consumable_types_path
  end
end
