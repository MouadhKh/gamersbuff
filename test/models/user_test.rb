require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new username: 'test_user', email: 'user@example.com',
                     password: "420420", password_confirmation: "420420"
  end

  test 'should be valid' do
    assert @user.valid?
  end
  test 'username should be present' do
    @user.username = ''
    assert_not @user.valid?
  end
  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end
  test 'email should not be to long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end
  test 'username should not be to long' do
    @user.username = 'a' * 16
    assert_not @user.valid?
  end
  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  test 'email addresses should be saved as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'user is not admin by default' do
    assert_not @user.admin
  end
end


