require 'test_helper'

class ContractComponentsControllerTest < ActionController::TestCase
  setup do
    @contract_component = contract_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_component" do
    assert_difference('ContractComponent.count') do
      post :create, contract_component: { chargeCode: @contract_component.chargeCode, price: @contract_component.price }
    end

    assert_redirected_to contract_component_path(assigns(:contract_component))
  end

  test "should show contract_component" do
    get :show, id: @contract_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_component
    assert_response :success
  end

  test "should update contract_component" do
    put :update, id: @contract_component, contract_component: { chargeCode: @contract_component.chargeCode, price: @contract_component.price }
    assert_redirected_to contract_component_path(assigns(:contract_component))
  end

  test "should destroy contract_component" do
    assert_difference('ContractComponent.count', -1) do
      delete :destroy, id: @contract_component
    end

    assert_redirected_to contract_components_path
  end
end
