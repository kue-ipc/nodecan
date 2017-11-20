require 'test_helper'

class IpSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ip_setting = ip_settings(:one)
  end

  test "should get index" do
    get ip_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_ip_setting_url
    assert_response :success
  end

  test "should create ip_setting" do
    assert_difference('IpSetting.count') do
      post ip_settings_url, params: { ip_setting: { name: @ip_setting.name, register_reservation: @ip_setting.register_reservation, require_address: @ip_setting.require_address, require_dhcp: @ip_setting.require_dhcp } }
    end

    assert_redirected_to ip_setting_url(IpSetting.last)
  end

  test "should show ip_setting" do
    get ip_setting_url(@ip_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_ip_setting_url(@ip_setting)
    assert_response :success
  end

  test "should update ip_setting" do
    patch ip_setting_url(@ip_setting), params: { ip_setting: { name: @ip_setting.name, register_reservation: @ip_setting.register_reservation, require_address: @ip_setting.require_address, require_dhcp: @ip_setting.require_dhcp } }
    assert_redirected_to ip_setting_url(@ip_setting)
  end

  test "should destroy ip_setting" do
    assert_difference('IpSetting.count', -1) do
      delete ip_setting_url(@ip_setting)
    end

    assert_redirected_to ip_settings_url
  end
end
