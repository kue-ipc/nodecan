require 'test_helper'

class OsProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @os_product = os_products(:one)
  end

  test "should get index" do
    get os_products_url
    assert_response :success
  end

  test "should get new" do
    get new_os_product_url
    assert_response :success
  end

  test "should create os_product" do
    assert_difference('OsProduct.count') do
      post os_products_url, params: { os_product: { name: @os_product.name, os_family_id: @os_product.os_family_id } }
    end

    assert_redirected_to os_product_url(OsProduct.last)
  end

  test "should show os_product" do
    get os_product_url(@os_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_os_product_url(@os_product)
    assert_response :success
  end

  test "should update os_product" do
    patch os_product_url(@os_product), params: { os_product: { name: @os_product.name, os_family_id: @os_product.os_family_id } }
    assert_redirected_to os_product_url(@os_product)
  end

  test "should destroy os_product" do
    assert_difference('OsProduct.count', -1) do
      delete os_product_url(@os_product)
    end

    assert_redirected_to os_products_url
  end
end
