require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup infomation" do
    get signup_path
    assert_select "form[action='/signup']"
    assert_no_difference "User.count" do
      post signup_path, params: { user: { name: "",
                                          email: "user@invalid",
                                          password: "foo",
                                          password_confirmation: "bar"} }
    end
    assert_template "users/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end

  test "valid signup infomation" do
    get signup_path
    assert_difference "User.count", 1 do
      post signup_path, params: { user: { name: "xuan le",
                                          email: "xuanle@gmail.com",
                                          password: "12345678",
                                          password_confirmation: "12345678"} }
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
    assert is_logged_in?
  end

end
