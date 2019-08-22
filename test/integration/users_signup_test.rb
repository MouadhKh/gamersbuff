test "invalid signup information" do
  get
  assert_no_difference 'User.count' do
    post new_registration_path, params: {
      user: {
        username: "",
        email: "test@user.com",
        password: "123456",
        password_confirmation: "123456"
      }
    }
    assert_template 'registration/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_select 'form[action="/signup"]'
  end
end
