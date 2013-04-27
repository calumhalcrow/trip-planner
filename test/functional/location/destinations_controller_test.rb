require 'test_helper'

class Location::DestinationsControllerTest < ActionController::TestCase
  setup do
    @location_destination = location_destinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_destinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_destination" do
    assert_difference('Location::Destination.count') do
      post :create, location_destination: {  }
    end

    assert_redirected_to location_destination_path(assigns(:location_destination))
  end

  test "should show location_destination" do
    get :show, id: @location_destination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_destination
    assert_response :success
  end

  test "should update location_destination" do
    put :update, id: @location_destination, location_destination: {  }
    assert_redirected_to location_destination_path(assigns(:location_destination))
  end

  test "should destroy location_destination" do
    assert_difference('Location::Destination.count', -1) do
      delete :destroy, id: @location_destination
    end

    assert_redirected_to location_destinations_path
  end
end
