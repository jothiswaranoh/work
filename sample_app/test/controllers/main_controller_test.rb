require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get main_home_url
    assert_response :success
  end

  test "should get feed" do
    get main_feed_url
    assert_response :success
  end

  test "should get message" do
    get main_message_url
    assert_response :success
  end

  test "should get video" do
    get main_video_url
    assert_response :success
  end

  test "should get games" do
    get main_games_url
    assert_response :success
  end
end
