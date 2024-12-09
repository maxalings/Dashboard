class WidgetsController < ApplicationController

  def new
    @widget = Widget.new
  end

  def index
    @widgets = current_user.widgets
    @user = current_user
  end

  def create
    @user = current_user
    @category = params[:category]
    @widget = Widget.new(
      user: @user,
      category: @category,
      width: Widget.default_width(@category),
      height: Widget.default_height(@category))
    @widget.save!
    redirect_to widgets_path
  end

  def fitness
    @widget = Widget.find(params[:widget_id])
    @tasks = @widget.tasks
  end

end
