require 'test_helper'

class RescueTimeChartsControllerTest < ActionController::TestCase
  setup do
    @rescue_time_chart = rescue_time_charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rescue_time_charts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rescue_time_chart" do
    assert_difference('RescueTimeChart.count') do
      post :create, rescue_time_chart: { height: @rescue_time_chart.height, key: @rescue_time_chart.key, script: @rescue_time_chart.script, show: @rescue_time_chart.show, title: @rescue_time_chart.title, width: @rescue_time_chart.width }
    end

    assert_redirected_to rescue_time_chart_path(assigns(:rescue_time_chart))
  end

  test "should show rescue_time_chart" do
    get :show, id: @rescue_time_chart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rescue_time_chart
    assert_response :success
  end

  test "should update rescue_time_chart" do
    patch :update, id: @rescue_time_chart, rescue_time_chart: { height: @rescue_time_chart.height, key: @rescue_time_chart.key, script: @rescue_time_chart.script, show: @rescue_time_chart.show, title: @rescue_time_chart.title, width: @rescue_time_chart.width }
    assert_redirected_to rescue_time_chart_path(assigns(:rescue_time_chart))
  end

  test "should destroy rescue_time_chart" do
    assert_difference('RescueTimeChart.count', -1) do
      delete :destroy, id: @rescue_time_chart
    end

    assert_redirected_to rescue_time_charts_path
  end
end
