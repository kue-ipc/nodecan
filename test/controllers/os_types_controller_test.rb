require 'test_helper'

class OsTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @os_type = os_types(:one)
  end

  test "should get index" do
    get os_types_url
    assert_response :success
  end

  test "should get new" do
    get new_os_type_url
    assert_response :success
  end

  test "should create os_type" do
    assert_difference('OsType.count') do
      post os_types_url, params: { os_type: { name: @os_type.name, require_security_software: @os_type.require_security_software } }
    end

    assert_redirected_to os_type_url(OsType.last)
  end

  test "should show os_type" do
    get os_type_url(@os_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_os_type_url(@os_type)
    assert_response :success
  end

  test "should update os_type" do
    patch os_type_url(@os_type), params: { os_type: { name: @os_type.name, require_security_software: @os_type.require_security_software } }
    assert_redirected_to os_type_url(@os_type)
  end

  test "should destroy os_type" do
    assert_difference('OsType.count', -1) do
      delete os_type_url(@os_type)
    end

    assert_redirected_to os_types_url
  end
end
