require "test_helper"

class BookControllerTest < ActionDispatch::IntegrationTest
  test "should get title:string" do
    get book_title:string_url
    assert_response :success
  end

  test "should get author:string" do
    get book_author:string_url
    assert_response :success
  end
end
