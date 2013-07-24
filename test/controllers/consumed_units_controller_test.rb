require 'test_helper'

class ConsumedUnitsControllerTest < ActionController::TestCase
  setup do
    @consumed_unit = consumed_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumed_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumed_unit" do
    assert_difference('ConsumedUnit.count') do
      post :create, consumed_unit: { amount: @consumed_unit.amount, consumable_type_id: @consumed_unit.consumable_type_id, unit: @consumed_unit.unit }
    end

    assert_redirected_to consumed_unit_path(assigns(:consumed_unit))
  end

  test "should show consumed_unit" do
    get :show, id: @consumed_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consumed_unit
    assert_response :success
  end

  test "should update consumed_unit" do
    patch :update, id: @consumed_unit, consumed_unit: { amount: @consumed_unit.amount, consumable_type_id: @consumed_unit.consumable_type_id, unit: @consumed_unit.unit }
    assert_redirected_to consumed_unit_path(assigns(:consumed_unit))
  end

  test "should destroy consumed_unit" do
    assert_difference('ConsumedUnit.count', -1) do
      delete :destroy, id: @consumed_unit
    end

    assert_redirected_to consumed_units_path
  end
end
