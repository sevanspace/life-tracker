require 'test_helper'

class ConsumableObjectsControllerTest < ActionController::TestCase
  setup do
    @consumable_object = consumable_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumable_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumable_object" do
    assert_difference('ConsumableObject.count') do
      post :create, consumable_object: { amount: @consumable_object.amount, consumable_type_id: @consumable_object.consumable_type_id, unit: @consumable_object.unit }
    end

    assert_redirected_to consumable_object_path(assigns(:consumable_object))
  end

  test "should show consumable_object" do
    get :show, id: @consumable_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consumable_object
    assert_response :success
  end

  test "should update consumable_object" do
    patch :update, id: @consumable_object, consumable_object: { amount: @consumable_object.amount, consumable_type_id: @consumable_object.consumable_type_id, unit: @consumable_object.unit }
    assert_redirected_to consumable_object_path(assigns(:consumable_object))
  end

  test "should destroy consumable_object" do
    assert_difference('ConsumableObject.count', -1) do
      delete :destroy, id: @consumable_object
    end

    assert_redirected_to consumable_objects_path
  end
end
