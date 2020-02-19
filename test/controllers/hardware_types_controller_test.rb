require 'test_helper'

class HardwareTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hardware_type = hardware_types(:one)
  end

  test "should get index" do
    get hardware_types_url
    assert_response :success
  end

  test "should get new" do
    get new_hardware_type_url
    assert_response :success
  end

  test "should create hardware_type" do
    assert_difference('HardwareType.count') do
      post hardware_types_url, params: { hardware_type: { category: @hardware_type.category, code: @hardware_type.code, description: @hardware_type.description, name: @hardware_type.name, order: @hardware_type.order } }
    end

    assert_redirected_to hardware_type_url(HardwareType.last)
  end

  test "should show hardware_type" do
    get hardware_type_url(@hardware_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_hardware_type_url(@hardware_type)
    assert_response :success
  end

  test "should update hardware_type" do
    patch hardware_type_url(@hardware_type), params: { hardware_type: { category: @hardware_type.category, code: @hardware_type.code, description: @hardware_type.description, name: @hardware_type.name, order: @hardware_type.order } }
    assert_redirected_to hardware_type_url(@hardware_type)
  end

  test "should destroy hardware_type" do
    assert_difference('HardwareType.count', -1) do
      delete hardware_type_url(@hardware_type)
    end

    assert_redirected_to hardware_types_url
  end
end
