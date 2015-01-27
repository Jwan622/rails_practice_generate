class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def new
  end

  def create
    if params[:play][:word].blank?
      flash[:error] = "blank"
      redirect_to :back
    else
      @play = Play.new(play_params)
      if @play.save
        redirect_to plays_path
      else
        flash[:error] = @play.errors.full_messages
        render :new
      end
    end
  end

  private

  def play_params
    params.require(:play).permit(:word)
  end
end
