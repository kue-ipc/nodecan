require 'test_helper'

class OsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o = os(:one)
  end

  test "should get index" do
    get os_index_url
    assert_response :success
  end

  test "should get new" do
    get new_o_url
    assert_response :success
  end

  test "should create o" do
    assert_difference('Os.count') do
      post os_index_url, params: { o: { end_of_life: @o.end_of_life, name: @o.name, os_type_id: @o.os_type_id } }
    end

    assert_redirected_to o_url(Os.last)
  end

  test "should show o" do
    get o_url(@o)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_url(@o)
    assert_response :success
  end

  test "should update o" do
    patch o_url(@o), params: { o: { end_of_life: @o.end_of_life, name: @o.name, os_type_id: @o.os_type_id } }
    assert_redirected_to o_url(@o)
  end

  test "should destroy o" do
    assert_difference('Os.count', -1) do
      delete o_url(@o)
    end

    assert_redirected_to os_index_url
  end
end
