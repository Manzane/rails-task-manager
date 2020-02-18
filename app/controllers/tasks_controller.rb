class TasksController < ApplicationController
  before_action :task_id, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def showd
  end

  def new
    @task = Task.new
  end

  def create
    Task.create!(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

    def destroy
      @task.destroy
      redirect_to tasks_path
    end


  private

    def task_params
    params.require(:task).permit(:title, :details)
    end

    def task_id
      @task = Task.find(params[:id])
    end

end
