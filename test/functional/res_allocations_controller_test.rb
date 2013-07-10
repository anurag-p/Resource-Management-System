require 'test_helper'

class ResAllocationsControllerTest < ActionController::TestCase
  setup do
    @res_allocation = res_allocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:res_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create res_allocation" do
    assert_difference('ResAllocation.count') do
      post :create, res_allocation: { hours: @res_allocation.hours, title: @res_allocation.title }
    end

    assert_redirected_to res_allocation_path(assigns(:res_allocation))
  end

  test "should show res_allocation" do
    get :show, id: @res_allocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @res_allocation
    assert_response :success
  end

  test "should update res_allocation" do
    put :update, id: @res_allocation, res_allocation: { hours: @res_allocation.hours, title: @res_allocation.title }
    assert_redirected_to res_allocation_path(assigns(:res_allocation))
  end

  test "should destroy res_allocation" do
    assert_difference('ResAllocation.count', -1) do
      delete :destroy, id: @res_allocation
    end

    assert_redirected_to res_allocations_path
  end
end
