require 'test_helper'

class ChallengeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get challenge_new_url
    assert_response :success
  end

  test "should get create" do
    get challenge_create_url
    assert_response :success
  end

  test "should get run" do
    get challenge_run_url
    assert_response :success
  end

  test "should get invite" do
    get challenge_invite_url
    assert_response :success
  end

  test "should get accept" do
    get challenge_accept_url
    assert_response :success
  end

  test "should get decline" do
    get challenge_decline_url
    assert_response :success
  end

end
