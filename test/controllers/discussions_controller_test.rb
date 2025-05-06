require "test_helper"

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @discussion = discussions(:one)
    @user = users(:one)
    sign_in @user
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
      post discussions_url, params: { discussion: { title: "New Discussion Title", content: "New discussion content.", pinned: false, closed: false } }
    end

    assert_redirected_to discussion_url(Discussion.last)
  end

  test "should show discussion" do
    get discussion_url(@discussion)
    assert_response :success
  end

  test "should get edit" do
    @discussion.update(user: @user)
    get edit_discussion_url(@discussion)
    assert_response :success
  end

  test "should update discussion" do
    @discussion.update(user: @user)
    patch discussion_url(@discussion), params: { discussion: { title: "Updated Discussion Title", content: "Updated discussion content." } }
    assert_redirected_to discussion_url(@discussion)
  end

  test "should destroy discussion" do
    @discussion.update(user: @user)
    assert_difference("Discussion.count", -1) do
      delete discussion_url(@discussion)
    end

    assert_redirected_to discussions_url
  end
end
