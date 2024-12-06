class WidgetsController < ApplicationController

  def new
    @widget = Widget.new
  end

  def index
    @widgets = current_user.widgets
    @user = current_user
  end

  def fitness
    @widget = Widget.find(params[:widget_id])
    @tasks = @widget.tasks
  end
end
