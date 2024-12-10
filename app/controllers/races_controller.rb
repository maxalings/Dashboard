class RacesController < ApplicationController
  def new
    @race = Race.new
    @widget = Widget.find(params[:widget_id])
  end

  def create
    p params
    @race = Race.new(race_params)
    @race.widget = Widget.find(params[:widget_id])
    @race.save!
    redirect_to widgets_path

  end

  def race_params
    params.permit(:day, :month, :year, :widget_id)
  end
end
