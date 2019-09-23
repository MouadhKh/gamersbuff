require 'test_helper'

class PlayTest < ActiveSupport::TestCase
  def setup
    @user = User.new username: 'test_user', email: 'user@example.com',
                     password: "420420", password_confirmation: "420420"
    @user.confirm
    @play = Play.new title: 'test_play', game: 'League of Legends'
  end

  test "should not save play because play required clip and user are missing" do
    @play.save
    assert_equal(@play.errors.full_messages.first, "User must exist")
    assert_equal(@play.errors.full_messages.second, "Clip required.")
  end
  test "should not save play because play required clip is missing" do
    @play.user = @user
    @play.save
    assert_equal(@play.errors.full_messages.first, "Clip required.")
  end
  test "play get attached to user" do
    assert_nil @play.user
    @play.user = @user
    assert_equal(@play.user.id, @user.id)
    @play.clip.attach(io: File.open("test/fixtures/files/great_escape.mp4"), filename: "great_escape.mp4")
    @play.save
    assert_not_empty @user.plays
  end
  test "clip should get attached to play" do
    @play.user = @user
    @play.clip.attach(io: File.open("test/fixtures/files/great_escape.mp4"), filename: "great_escape.mp4")
    assert @play.clip.attached?
  end

  test "other extensions than mp4 aren't accepted" do
    @play.user = @user
    @play.clip.attach(io: File.open("test/fixtures/files/jinx.jpg"), filename: "jinx.jpg")
    @play.save
    assert_equal(@play.errors.full_messages.first, "Clip must be MP4.")
  end

  test "should save play" do
    @play.user = @user
    @play.clip.attach(io: File.open("test/fixtures/files/great_escape.mp4"), filename: "great_escape.mp4")
    assert @play.save
  end
  ##TODO , too large usecase to do later ( maybe uploading a large file is an overkill)

end
