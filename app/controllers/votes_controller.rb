class VotesController < ApplicationController
  before_action :find_play

  def create
    if already_voted?
      flash[:alert] = "You can't vote for the same play more than once"
    else
      flash[:notice] = 'Successfully voted for " ' + @play.title + ' "'
      @play.votes.create(user_id: current_user.id)
    end
    redirect_to root_path
  end

  private

  def already_voted?
    Vote.where(user_id: current_user.id, play_id:
      params[:play_id]).exists?
  end

  def find_play
    @play = Play.find(params[:play_id])
  end

end
