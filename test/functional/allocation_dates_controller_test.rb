require 'test_helper'

class AllocationDatesControllerTest < ActionController::TestCase
  setup do
    @allocation_date = allocation_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allocation_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allocation_date" do
    assert_difference('AllocationDate.count') do
      post :create, allocation_date: { value: @allocation_date.value }
    end

    assert_redirected_to allocation_date_path(assigns(:allocation_date))
  end

  test "should show allocation_date" do
    get :show, id: @allocation_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allocation_date
    assert_response :success
  end

  test "should update allocation_date" do
    put :update, id: @allocation_date, allocation_date: { value: @allocation_date.value }
    assert_redirected_to allocation_date_path(assigns(:allocation_date))
  end

  test "should destroy allocation_date" do
    assert_difference('AllocationDate.count', -1) do
      delete :destroy, id: @allocation_date
    end

    assert_redirected_to allocation_dates_path
  end
end
