class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_day, :end_day, :all_day))
    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
