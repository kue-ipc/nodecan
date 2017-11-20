require 'test_helper'

class SecuritySoftwaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @security_software = security_softwares(:one)
  end

  test "should get index" do
    get security_softwares_url
    assert_response :success
  end

  test "should get new" do
    get new_security_software_url
    assert_response :success
  end

  test "should create security_software" do
    assert_difference('SecuritySoftware.count') do
      post security_softwares_url, params: { security_software: { has_expiration: @security_software.has_expiration, name: @security_software.name } }
    end

    assert_redirected_to security_software_url(SecuritySoftware.last)
  end

  test "should show security_software" do
    get security_software_url(@security_software)
    assert_response :success
  end

  test "should get edit" do
    get edit_security_software_url(@security_software)
    assert_response :success
  end

  test "should update security_software" do
    patch security_software_url(@security_software), params: { security_software: { has_expiration: @security_software.has_expiration, name: @security_software.name } }
    assert_redirected_to security_software_url(@security_software)
  end

  test "should destroy security_software" do
    assert_difference('SecuritySoftware.count', -1) do
      delete security_software_url(@security_software)
    end

    assert_redirected_to security_softwares_url
  end
end
