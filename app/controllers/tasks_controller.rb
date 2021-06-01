class TasksController < ApplicationController
 before_action :set_task, only: [:show, :edit, :update, :destroy]
  # before_action :set_task, except: [:index, :new, :create]

  def index
    @tasks = Task.all
  end

  def show
    # it's getting the @task because of the before_action
  end

  def new
    @task = Task.new
  end

  def create
    # We are using the task_params method to filter out unwanted fields
    task = Task.new(task_params)
    Task.save

    redirect_to tasks_path
  end

  def edit
    # it's getting the @task because of the before_action
  end

  def update
    # it's getting the @task because of the before_action

    # We are using the task_params method to filter out unwanted fields
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    # it's getting the @task because of the before_action
    @task.destroy

    redirect_to tasks_path
  end

  private

  # This method will set @task for all actions that need it, fetching the task from the
  # database by finding it with params[:id], since all the actions will have :id in the path
  # (eg: /tasks/:id/edit)
  def set_task
    @task = Task.find(params[:id])
  end

  # This is called "strong params" and is a security thing so we don't get ALL the fields from the
  # form, since the users can send extra information.
  def task_params
    params.require(:task).permit(:name, :address, :rating)
  end
end
