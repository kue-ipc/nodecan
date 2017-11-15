require 'test_helper'

class NicTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nic_type = nic_types(:one)
  end

  test "should get index" do
    get nic_types_url
    assert_response :success
  end

  test "should get new" do
    get new_nic_type_url
    assert_response :success
  end

  test "should create nic_type" do
    assert_difference('NicType.count') do
      post nic_types_url, params: { nic_type: { allow_laa: @nic_type.allow_laa, display_name: @nic_type.display_name, name: @nic_type.name } }
    end

    assert_redirected_to nic_type_url(NicType.last)
  end

  test "should show nic_type" do
    get nic_type_url(@nic_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_nic_type_url(@nic_type)
    assert_response :success
  end

  test "should update nic_type" do
    patch nic_type_url(@nic_type), params: { nic_type: { allow_laa: @nic_type.allow_laa, display_name: @nic_type.display_name, name: @nic_type.name } }
    assert_redirected_to nic_type_url(@nic_type)
  end

  test "should destroy nic_type" do
    assert_difference('NicType.count', -1) do
      delete nic_type_url(@nic_type)
    end

    assert_redirected_to nic_types_url
  end
end
