require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    #goal here is to bypass the recaptcha , those keys are defined from google for NO CAPTCHA
    Recaptcha.configure do |config|
      config.site_key = "6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"
      config.secret_key = "6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe"
    end
  end

  test "should get contact index" do
    get contact_index_url
    assert_response :success
  end
  test "shouldn't deliver because validations aren't passed" do
    post contact_index_path, params: {contact: {username: "shrt", email: "test_user.user.de", message: "I m here to help finding some problems, just ignore me"}}
    assert 200
    assert_select "ul#contact_form_errors"
    assert_empty ActionMailer::Base.deliveries

  end
  test "should deliver" do
    post contact_index_path, params: {contact: {username: "test_user", email: "test_user@user.de", message: "I m here to help finding some problems, just ignore me"}}
    assert_redirected_to root_path
    get root_path
    assert_select "p.alert-success"
    assert_equal 1, ActionMailer::Base.deliveries.size
  end

end
