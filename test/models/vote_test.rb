require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  def setup
    @user = User.new username: 'test_user', email: 'user@example.com',
                     password: "420420", password_confirmation: "420420"
    @user.confirm
    @play = Play.new title: 'test_play', game: 'League of Legends'
    @play.user = @user
    @play.clip.attach(io: File.open("test/fixtures/files/great_escape.mp4"), filename: "great_escape.mp4")
    @play.save
  end

  test "user shouldn't initially have votes" do
    assert_empty @user.votes
  end
  test "play shouldn't initially have votes" do
    assert_empty @play.votes
  end
  test "should vote successfully => vote added to play" do
    assert_empty @play.votes
    @play.votes.create(user_id: @user.id)
    assert_not_empty @play.votes
  end
  test "should vote successfully => vote added to user" do
    assert_empty @user.votes
    @play.votes.create(user_id: @user.id)
    assert_not_empty @user.votes
  end
  test "relationship vote between play and user successfully created" do
    @play.votes.create(user_id: @user.id)
    assert_not_empty @play.votes
    assert Vote.where(user_id: @user.id, play_id:
      @play.id).exists?
  end
end
