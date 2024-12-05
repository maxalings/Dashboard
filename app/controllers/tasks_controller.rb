class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def new_routine
    @task = Task.new
    @widget = Widget.find(params[:widget_id])
  end

  def create_routine
    @task = Task.new(task_params)
    @task.widget = Widget.find(params[:widget_id])
    @task.save!
    redirect_to widget_fitness_path
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  private

  def task_params
    params.require(:task).permit(:title, :done, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
  end
end
