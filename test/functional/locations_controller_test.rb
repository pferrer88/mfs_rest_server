require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { address1: @location.address1, address2: @location.address2, city: @location.city, isActive: @location.isActive, lastModifiedBy: @location.lastModifiedBy, lastModifiedOn: @location.lastModifiedOn, name: @location.name, postalCode: @location.postalCode, state: @location.state }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    put :update, id: @location, location: { address1: @location.address1, address2: @location.address2, city: @location.city, isActive: @location.isActive, lastModifiedBy: @location.lastModifiedBy, lastModifiedOn: @location.lastModifiedOn, name: @location.name, postalCode: @location.postalCode, state: @location.state }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to locations_path
  end
end
