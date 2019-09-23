require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new username: 'test_user', email: 'user@example.com',
                     password: "420420", password_confirmation: "420420"
    @user.confirm
    @play = Play.new title: 'test_play', game: 'League of Legends'
    @play.user = @user
    @play.clip.attach(io: File.open("test/fixtures/files/great_escape.mp4"), filename: "great_escape.mp4")
    @play.save
  end

  test "shouldn't be able to vote when not logged in" do
    get root_path
    assert_select "button#vote-btn", false
  end

  test "should vote successfully" do
    sign_in @user
    get root_path
    assert_select 'button#vote-btn'
    post play_votes_path(play_id: @play.id, user_id: @user.id)
    assert_redirected_to root_path
    assert_not_empty @play.votes
  end

  test "shouldn't vote the same play twice" do
    sign_in @user
    get root_path
    assert_select 'button#vote-btn'
    post play_votes_path(play_id: @play.id, user_id: @user.id)
    assert_redirected_to root_path
    assert_not_empty @play.votes
    post play_votes_path(play_id: @play.id, user_id: @user.id)
    get root_path
    assert_select 'p.alert-danger', html: 'You can\'t vote for the same play more than once' #TODO : will maybe change later when applying internationalization
  end
end
