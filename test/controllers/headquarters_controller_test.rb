require 'test_helper'

class HeadquartersControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get headquarters_main_url
    assert_response :success
  end

  test "should get show_user" do
    get headquarters_show_user_url
    assert_response :success
  end

  test "should get friend_invite" do
    get headquarters_friend_invite_url
    assert_response :success
  end

  test "should get friend_accept" do
    get headquarters_friend_accept_url
    assert_response :success
  end

  test "should get unfriend" do
    get headquarters_unfriend_url
    assert_response :success
  end

end
