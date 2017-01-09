require 'test_helper'

class AdiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show {id: adies(:two).id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :post, {adie: {first_name: "Bianca", last_name: "Ortega", cohort: "5"}}
    assert_response :render
  end

  test "creating an Adie changes the number of Adies" do
    assert_difference("Adie.count", 1) do
      post :create, {adie: {first_name: "Bianca", last_name: "Ortega", cohort: "5"}}
      assert_response :render
    end
  end

  test "should get edit" do
    get :edit, {id: adies(:one).id}
    assert_response :success
  end

  patch :update, id: albums(:one), album: {synopsis: "Noice"}
    assert_equal "Noice", assigns(:album).synopsis
    assert_response :redirect

  test "should get update" do
    patch :update, id: adies(:one), adie: {current_company: "Google"}
    assert_equal "Google", assigns(:adie).current_company
    assert_response :render
  end

  test "should get destroy" do
    delete :destroy, {id: adies(:one).id}
    assert_response :redirect
  end

  test "deleting an Adie changes the number of Adies" do
    assert_difference("Adie.count", -1) do
      delete :destroy, {id: adies(:one).id}}
      assert_response :redirect
    end
  end

end
