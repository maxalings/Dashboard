class RacesController < ApplicationController
  def new
    @race = Race.new
    @widget = Widget.find(params[:widget_id])
  end

  def create
    @race = Race.new(race_params)
    @race.widget = Widget.find(params[:widget_id])

    given_date = Time.new(params[:year].to_i, params[:month].to_i, params[:day].to_i, 0, 0, 0)
    now = Time.now
    total_seconds = (given_date - now).to_i

    if total_seconds.positve?
      @days = total_seconds / (60 * 60 * 24)
      @hours = (total_seconds % (60 * 60 * 24)) / (60 * 60)
      @minutes = (total_seconds % (60 * 60)) / 60
      @seconds = total_seconds % 60
    else
      @days = @hours = @minutes = @seconds = 0
    end

    @race.save!
    # redirect_to widgets_path(current_user.id)
  end

  def race_params
    params.require(:race).permit(:day, :month, :year)
  end
end
