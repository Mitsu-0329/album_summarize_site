require "test_helper"

class PhotoAlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photo_albums_index_url
    assert_response :success
  end

  test "should get show" do
    get photo_albums_show_url
    assert_response :success
  end
end
