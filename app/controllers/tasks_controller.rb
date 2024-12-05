class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save!
    redirect_to widget_habits_path(@task.widget)
    # TODO: redirect to the widget page 
  end

  private

  def task_params
    params.require(:task).permit(:title, :done, :widget_id)
  end
end
