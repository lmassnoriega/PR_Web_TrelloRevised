class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  respond_to :html
  
  def assigned
    @tasks = Task.all.order(completed: :asc).order(duedate: :desc)
    respond_with(@tasks)
  end

  def index
    @tasks = Task.all.order(completed: :asc).order(duedate: :desc)
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.author = current_user.id
    @task.save
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:author, :title, :description, :duration, :begindate, :duedate, :responsible, :completed)
    end
end
