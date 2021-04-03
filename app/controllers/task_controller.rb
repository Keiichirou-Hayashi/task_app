class TaskController < ApplicationController
  def index
    @tasks = Task.all
    render :layout => 'task_layout'
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title ,:start_day ,:end_day ,:all_day ,:memo))
    if @task.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :task_index
    else
        flash.now[:aleart] = "スケジュールを登録できませんでした"
        render action: :new
    end

    if @task.save == false
      flash[:aleart] = "スケジュールを登録できませんでした"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id]) 
    if @task.update(params.require(:task).permit(:title ,:start_day ,:end_day ,:all_day ,:memo))
      flash[:notice] = "スケジュールを編集しました"
      redirect_to :task_index
    else
      flash.now[:aleart] = "スケジュールを登録できませんでした"
      render action: :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:aleart] = "スケジュールを削除しました"
    redirect_to :task_index
  end
end
