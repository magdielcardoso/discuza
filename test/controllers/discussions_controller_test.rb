require "test_helper"

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discussion = discussions(:one)
  end

  test "should get index" do
    get discussions_url
    assert_response :success
  end

  test "should get new" do
    get new_discussion_url
    assert_response :success
  end

  test "should create discussion" do
    assert_difference("Discussion.count") do
      post discussions_url, params: { discussion: { closed: @discussion.closed, pinned: @discussion.pinned, title: @discussion.title, user_id: @discussion.user_id } }
    end

    assert_redirected_to discussion_url(Discussion.last)
  end

  test "should show discussion" do
    get discussion_url(@discussion)
    assert_response :success
  end

  test "should get edit" do
    get edit_discussion_url(@discussion)
    assert_response :success
  end

  test "should update discussion" do
    patch discussion_url(@discussion), params: { discussion: { closed: @discussion.closed, pinned: @discussion.pinned, title: @discussion.title, user_id: @discussion.user_id } }
    assert_redirected_to discussion_url(@discussion)
  end

  test "should destroy discussion" do
    assert_difference("Discussion.count", -1) do
      delete discussion_url(@discussion)
    end

    assert_redirected_to discussions_url
  end
end
