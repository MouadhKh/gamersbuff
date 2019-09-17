require 'test_helper'

class PlaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new username: 'test_user', email: 'user@example.com',
                     password: "420420", password_confirmation: "420420"
    @user.confirm
    @play = Play.new title: 'test_play', game: 'League of Legends'
    @play.user = @user
    @play.clip.attach(io: File.open("test/fixtures/files/great_escape.mp4"), filename: "great_escape.mp4")
  end

  test "should get index" do
    get plays_url
    assert_response :success
  end

  test "should get new" do
    get new_play_url
    assert_response :success
  end

  test "should create play" do
    Play.destroy_all
    assert_difference('Play.count') do
      @play.save
      post plays_url, params: {:play => {game: @play.game, title: @play.title}, clip: @play.clip}
    end
  end

  test "should show play" do
    @play.save
    get play_url(@play)
    assert_response :success
  end

  test "should destroy play" do
    @play.save
    assert_difference('Play.count', -1) do
      delete play_url(@play)
    end

    assert_redirected_to plays_url
  end
end
