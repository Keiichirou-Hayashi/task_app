class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.permit(:title, :start_day, :end_day, :all_day))
    if @task.save
      flash[:notice] = "スケジュールを登録しました。"
      redirect_to :task_index
    else
      render :new_task
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.update(params.require(:task).permit(:title, :start_day, :end_day, :all_day))
    if @task.save
      flash[:notice] = "#{@user.id}のスケジュールを編集しました。"
      redirect_to :task_index
    else
      render :edit_task
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました。"
    redirect_to :task_index
  end
end
