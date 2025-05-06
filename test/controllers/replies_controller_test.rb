require "test_helper"

class RepliesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @discussion = discussions(:one)
    @reply = replies(:one)
    @reply.update(discussion: @discussion)
    sign_in users(:one)
  end

  test "should create reply" do
    assert_difference("Reply.count") do
      post discussion_replies_url(@discussion), params: { reply: { content: "New reply content via ActionText" } }
    end

    assert_redirected_to discussion_url(@discussion, anchor: "reply_#{Reply.last.id}")
  end

  test "should show reply" do
    skip "Rota show para replies não está implementada/testada individualmente."
  end

  test "should get edit" do
    get edit_discussion_reply_url(@discussion, @reply)
    assert_response :success
  end

  test "should update reply" do
    patch discussion_reply_url(@discussion, @reply), params: { reply: { content: "Updated reply content via ActionText" } }
    assert_redirected_to discussion_url(@discussion, anchor: "reply_#{@reply.id}")
  end

  test "should destroy reply" do
    assert_difference("Reply.count", -1) do
      delete discussion_reply_url(@discussion, @reply)
    end

    assert_redirected_to discussion_url(@discussion)
  end
end
