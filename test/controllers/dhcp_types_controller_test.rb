require 'test_helper'

class DhcpTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dhcp_type = dhcp_types(:one)
  end

  test "should get index" do
    get dhcp_types_url
    assert_response :success
  end

  test "should get new" do
    get new_dhcp_type_url
    assert_response :success
  end

  test "should create dhcp_type" do
    assert_difference('DhcpType.count') do
      post dhcp_types_url, params: { dhcp_type: { display_name: @dhcp_type.display_name, leasable: @dhcp_type.leasable, managed: @dhcp_type.managed, name: @dhcp_type.name, reservable: @dhcp_type.reservable } }
    end

    assert_redirected_to dhcp_type_url(DhcpType.last)
  end

  test "should show dhcp_type" do
    get dhcp_type_url(@dhcp_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_dhcp_type_url(@dhcp_type)
    assert_response :success
  end

  test "should update dhcp_type" do
    patch dhcp_type_url(@dhcp_type), params: { dhcp_type: { display_name: @dhcp_type.display_name, leasable: @dhcp_type.leasable, managed: @dhcp_type.managed, name: @dhcp_type.name, reservable: @dhcp_type.reservable } }
    assert_redirected_to dhcp_type_url(@dhcp_type)
  end

  test "should destroy dhcp_type" do
    assert_difference('DhcpType.count', -1) do
      delete dhcp_type_url(@dhcp_type)
    end

    assert_redirected_to dhcp_types_url
  end
end
