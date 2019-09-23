class PlaysController < ApplicationController
  before_action :set_play, only: [:show, :destroy]

  #Order the recent plays by created_at
  # Only recent plays (7 days ago) will be kept
  def index
    @plays = Play.with_attached_clip.recent_plays.includes(:user, :clip_attachment, :votes).order(:created_at)
  end

  # GET /plays/1
  # GET /plays/1.json
  def show
  end

  # GET /plays/new
  def new
    @play = Play.new

    #@play = current_user.plays.build(play_params)

  end

  # GET /plays/1/edit
  def edit
  end

  # POST /plays
  # POST /plays.json
  def create
    #@play = current_user.plays.build(play_params)
    #@play.clip.attach(params[:clip])
    @play = Play.new(play_params)
    @play.user = current_user
    respond_to do |format|
      if @play.save
        format.html {redirect_to @play}
        format.json {render :show, status: :created, location: @play}
      else
        format.html {render :new}
        format.json {render json: @play.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /plays/1
  # PATCH/PUT /plays/1.json
  def update
    respond_to do |format|
      if @play.update(play_params)
        format.html {redirect_to @play, notice: 'Play was successfully updated.'}
        format.json {render :show, status: :ok, location: @play}
      else
        format.html {render :edit}
        format.json {render json: @play.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.json
  def destroy
    @play.destroy
    respond_to do |format|
      format.html {redirect_to plays_url, notice: 'Play was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_play
    @play = Play.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def play_params
    params.require(:play).permit(:title, :game, :clip)
  end
end
