require 'test_helper'

class OsFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @os_family = os_families(:one)
  end

  test "should get index" do
    get os_families_url
    assert_response :success
  end

  test "should get new" do
    get new_os_family_url
    assert_response :success
  end

  test "should create os_family" do
    assert_difference('OsFamily.count') do
      post os_families_url, params: { os_family: { name: @os_family.name, require_security_software: @os_family.require_security_software } }
    end

    assert_redirected_to os_family_url(OsFamily.last)
  end

  test "should show os_family" do
    get os_family_url(@os_family)
    assert_response :success
  end

  test "should get edit" do
    get edit_os_family_url(@os_family)
    assert_response :success
  end

  test "should update os_family" do
    patch os_family_url(@os_family), params: { os_family: { name: @os_family.name, require_security_software: @os_family.require_security_software } }
    assert_redirected_to os_family_url(@os_family)
  end

  test "should destroy os_family" do
    assert_difference('OsFamily.count', -1) do
      delete os_family_url(@os_family)
    end

    assert_redirected_to os_families_url
  end
end
