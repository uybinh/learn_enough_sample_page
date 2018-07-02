require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:uybinh)
    @other_user = users(:minhxuan)
  end

  test "layout links when not logged in" do
    get root_path
    assert_template "static_page/home"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", users_path, count: 0
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test "layout links when logged in" do
    get login_path
    log_in_as(@user, remember_me: "0")
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect! # To actual visit the target page
    assert_template "users/show"
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end

end
