class TasksController < ApplicationController

  def new
    @task = Task.new
    @widget = Widget.find(params[:widget_id])
  end

  def create
    @task = Task.new(task_params)
    @task.widget = Widget.find(params[:widget_id])
    @task.save!
    # redirect_to widget_habits_path(@task.widget)
    # TODO: redirect to the widget page 
  end

  private

  def task_params
    params.require(:task).permit(:title, :done)
  end
end
