require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: {
        locale: I18n.locale,
        user: {
          username: "",
          email: "user@test.de",
          password: "123456",
          password_confirmation: "123456"
        }
      }
      assert_template 'devise/registrations/new'
      assert_select "ul#form_errors"
    end
  end
  test "valid signup information with account activation" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: {
        user:
          {username: "test_user",
           email: "test@user.com",
           password: "123456",
           password_confirmation: "123456"
          }}
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.confirmed?
    # Try to sign in when user is unconfirmed
    catch(:warden) do #bad workaround
      sign_in user
      assert_redirected_to root_path, false
    end
    user.confirm
    sign_in user
    assert_redirected_to root_path
  end
end
