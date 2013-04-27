require 'test_helper'

class Location::HomesControllerTest < ActionController::TestCase
  setup do
    @location_home = location_homes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_homes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_home" do
    assert_difference('Location::Home.count') do
      post :create, location_home: {  }
    end

    assert_redirected_to location_home_path(assigns(:location_home))
  end

  test "should show location_home" do
    get :show, id: @location_home
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_home
    assert_response :success
  end

  test "should update location_home" do
    put :update, id: @location_home, location_home: {  }
    assert_redirected_to location_home_path(assigns(:location_home))
  end

  test "should destroy location_home" do
    assert_difference('Location::Home.count', -1) do
      delete :destroy, id: @location_home
    end

    assert_redirected_to location_homes_path
  end
end
