require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_page_home_path
    assert_response :success
  end

  test "should get help" do
    get static_page_help_path
    assert_response :success
  end

  test "should get about" do
    get static_page_about_path
    assert_response :success
  end

end
