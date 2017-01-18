require 'test_helper'

class AdiesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @adie1 = adies(:one)
    @adie2 = adies(:two)
  end

  test "should get index" do
    # get '/adies'
    get adies_url
    assert_response :redirect
  end

  test "should get show" do
    get adie_url(@adie2)
    assert_response :redirect
  end
#
#   test "should get new" do
#     get adies_new_url
#     assert_response :success
#   end
#
#   test "should get create" do
#     get "/post", {adie: {first_name: "Bianca", last_name: "Ortega", cohort: "5"}}
#     assert_response :render
#   end
#
#   test "creating an Adie changes the number of Adies" do
#     assert_difference("Adie.count", 1) do
#       post "/create", {adie: {first_name: "Bianca", last_name: "Ortega", cohort: "5"}}
#       assert_response :render
#     end
#   end
#
#   test "should get edit" do
#     get "/edit", {id: adies(:one).id}
#     assert_response :success
#   end
#
#   test "should get update" do
#     patch "/update", id: adies(:one), adie: {current_company: "Google"}
#     assert_equal "Google", assigns(:adie).current_company
#     assert_response :render
#   end
#
#   test "should get destroy" do
#     delete "/destroy", {id: adies(:one).id}
#     assert_response :redirect
#   end
#
#   test "deleting an Adie changes the number of Adies" do
#     assert_difference("Adie.count", -1) do
#       delete "/destroy", {id: adies(:one).id}
#       assert_response :redirect
#     end
#   end
#
end
