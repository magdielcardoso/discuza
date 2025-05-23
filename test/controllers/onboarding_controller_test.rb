require "test_helper"

class OnboardingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get onboarding_index_url
    assert_response :success
  end

  test "should get create" do
    get onboarding_create_url
    assert_response :success
  end
end
