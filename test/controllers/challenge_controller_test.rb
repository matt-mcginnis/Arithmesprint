require 'test_helper'

class ChallengeControllerTest < ActionDispatch::IntegrationTest
  test "should get challenge_create" do
    get challenge_challenge_create_url
    assert_response :success
  end

  test "should get challenge_run" do
    get challenge_challenge_run_url
    assert_response :success
  end

  test "should get challenge_invite" do
    get challenge_challenge_invite_url
    assert_response :success
  end

  test "should get challenge_accept" do
    get challenge_challenge_accept_url
    assert_response :success
  end

  test "should get challenge_decline" do
    get challenge_challenge_decline_url
    assert_response :success
  end

end
