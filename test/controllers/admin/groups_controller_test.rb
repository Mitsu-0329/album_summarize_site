require "test_helper"

class Admin::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_groups_edit_url
    assert_response :success
  end

  test "should get family_index" do
    get admin_groups_family_index_url
    assert_response :success
  end

  test "should get index" do
    get admin_groups_index_url
    assert_response :success
  end
end
