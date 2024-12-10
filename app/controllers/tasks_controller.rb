class TasksController < ApplicationController

  def new
    @task = Task.new
    @widget = Widget.find(params[:widget_id])
  end

  def create
    @task = Task.new(task_params)
    @task.widget = Widget.find(params[:widget_id])
    @task.save!
    redirect_to widgets_path(current_user.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.widget = Widget.find(params[:widget_id])
    @task.destroy
    redirect_to widgets_path(current_user)
  end

  def mark_done
    @task = Task.find(params[:id])
    @task.update(done: !@task.done)
  end

  def new_routine
    @task = Task.new
    @widget = Widget.find(params[:widget_id])
  end

  def create_routine
    @task = Task.new(task_params)
    @task.widget = Widget.find(params[:widget_id])
    @task.save
    redirect_to widgets_path(current_user)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.widget = Widget.find(params[:widget_id])
    @task.destroy
    redirect_to widgets_path(current_user)
  end

  private

  def task_params
    params.require(:task).permit(:title, :done, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
  end
end
