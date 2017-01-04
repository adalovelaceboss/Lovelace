require 'test_helper'

class AdiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adies_index_url
    assert_response :success
  end

  test "should get show" do
    get adies_show_url
    assert_response :success
  end

  test "should get new" do
    get adies_new_url
    assert_response :success
  end

  test "should get create" do
    get adies_create_url
    assert_response :success
  end

  test "should get edit" do
    get adies_edit_url
    assert_response :success
  end

  test "should get update" do
    get adies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get adies_destroy_url
    assert_response :success
  end

end
