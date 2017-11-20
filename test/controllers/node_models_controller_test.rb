require 'test_helper'

class NodeModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @node_model = node_models(:one)
  end

  test "should get index" do
    get node_models_url
    assert_response :success
  end

  test "should get new" do
    get new_node_model_url
    assert_response :success
  end

  test "should create node_model" do
    assert_difference('NodeModel.count') do
      post node_models_url, params: { node_model: { name: @node_model.name } }
    end

    assert_redirected_to node_model_url(NodeModel.last)
  end

  test "should show node_model" do
    get node_model_url(@node_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_node_model_url(@node_model)
    assert_response :success
  end

  test "should update node_model" do
    patch node_model_url(@node_model), params: { node_model: { name: @node_model.name } }
    assert_redirected_to node_model_url(@node_model)
  end

  test "should destroy node_model" do
    assert_difference('NodeModel.count', -1) do
      delete node_model_url(@node_model)
    end

    assert_redirected_to node_models_url
  end
end
