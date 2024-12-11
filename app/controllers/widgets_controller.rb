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

  def edit
    @widget = Widget.find(params[:id])
  end

  def update
    @widget = Widget.find(params[:id])
    @widget.update(widget_params)
    # No need for app/views/restaurants/update.html.erb
  end

  def fitness
    @widget = Widget.find(params[:widget_id])
    @tasks = @widget.tasks
  end

  private

  def widget_params
    params.require(:widget).permit(:timezone, :progress, :goal)
  end
end
