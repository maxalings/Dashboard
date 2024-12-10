class RacesController < ApplicationController

  def new
    @race = Race.new
    @widget = Widget.find(params[:widget_id])
  end

  def create
    @race = Race.new(race_params)
    @race.widget = Widget.find(params[:widget_id])
    @race.save
    redirect_to widgets_path(current_user)
  end

  def destroy
    @race = Race.find(params[:id])
    @race.destroy
    redirect_to widgets_path(current_user)
  end

  def race_params
    params.permit(:day, :month, :year, :widget_id)
  end


end
