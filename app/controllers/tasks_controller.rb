class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    ide = params[:id].to_i
    @task = Task.find(ide)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    ide = params[:id].to_i
    @task = Task.find(ide)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    ide = params[:id].to_i
    @task = Task.find(ide)
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
