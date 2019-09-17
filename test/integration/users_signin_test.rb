require 'test_helper'

class UsersSigninTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:opix)
  end

  test "login with invalid credentials" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: {session: {username: "", password: ""}}
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid credentials followed by logout" do
    get new_user_session_path
    sign_in @user
    puts status
    get edit_user_registration_path

    assert_response :success #User is logged in, Profile is reachable
    sign_out @user
    get edit_user_registration_path
    assert_response :found
  end
end
