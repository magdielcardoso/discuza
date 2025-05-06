require "test_helper"

class RepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reply = replies(:one)
  end

  test "should get index" do
    get replies_url
    assert_response :success
  end

  test "should get new" do
    get new_reply_url
    assert_response :success
  end

  test "should create reply" do
    assert_difference("Reply.count") do
      post replies_url, params: { reply: { discussion_id: @reply.discussion_id, marked_as_answer: @reply.marked_as_answer, user_id: @reply.user_id } }
    end

    assert_redirected_to reply_url(Reply.last)
  end

  test "should show reply" do
    get reply_url(@reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_reply_url(@reply)
    assert_response :success
  end

  test "should update reply" do
    patch reply_url(@reply), params: { reply: { discussion_id: @reply.discussion_id, marked_as_answer: @reply.marked_as_answer, user_id: @reply.user_id } }
    assert_redirected_to reply_url(@reply)
  end

  test "should destroy reply" do
    assert_difference("Reply.count", -1) do
      delete reply_url(@reply)
    end

    assert_redirected_to replies_url
  end
end
