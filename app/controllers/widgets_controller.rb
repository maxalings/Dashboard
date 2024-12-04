class WidgetsController < ApplicationController
  def index
    @widgets = current_user.widgets
    @user = current_user
  end

  def fitness

  end

  def habits
    @widget = Widget.find(params[:widget_id])
    @tasks = @widget.tasks
  end

end