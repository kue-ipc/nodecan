require 'test_helper'

class OsVersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @os_version = os_versions(:one)
  end

  test "should get index" do
    get os_versions_url
    assert_response :success
  end

  test "should get new" do
    get new_os_version_url
    assert_response :success
  end

  test "should create os_version" do
    assert_difference('OsVersion.count') do
      post os_versions_url, params: { os_version: { end_of_life: @os_version.end_of_life, name: @os_version.name, os_product_id: @os_version.os_product_id, release: @os_version.release, version: @os_version.version } }
    end

    assert_redirected_to os_version_url(OsVersion.last)
  end

  test "should show os_version" do
    get os_version_url(@os_version)
    assert_response :success
  end

  test "should get edit" do
    get edit_os_version_url(@os_version)
    assert_response :success
  end

  test "should update os_version" do
    patch os_version_url(@os_version), params: { os_version: { end_of_life: @os_version.end_of_life, name: @os_version.name, os_product_id: @os_version.os_product_id, release: @os_version.release, version: @os_version.version } }
    assert_redirected_to os_version_url(@os_version)
  end

  test "should destroy os_version" do
    assert_difference('OsVersion.count', -1) do
      delete os_version_url(@os_version)
    end

    assert_redirected_to os_versions_url
  end
end
