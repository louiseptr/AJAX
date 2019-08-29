class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    #task.create au lieu de task.new
    @task = Task.create(task_params)
    @category = Category.find(category_params)
    @task.category = @category
    #ajout de respond_to
      respond_to do |format|
            format.html { redirect_to root_path }
            format.js { }
      end
    if @task.save
      redirect_to root_path
      flash[:notice] = "Task created"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
    flash[:notice] = "Task edited"
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
