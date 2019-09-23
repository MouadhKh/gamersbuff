class TopPlaysController < ApplicationController
  def index
    @top_plays = Play.top_plays
  end
end
