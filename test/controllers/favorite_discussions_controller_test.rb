require "test_helper"

class FavoriteDiscussionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get favorite_discussions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_discussions_destroy_url
    assert_response :success
  end
end
