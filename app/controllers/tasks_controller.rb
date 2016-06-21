class TasksController < ApplicationController

  def create
    @discussion = Discussion.new
    @task = Task.new task_params
    @project = Project.find params[:project_id]
    @task.project = @project
    if @task.save
      redirect_to project_path(@project)
    else
      render "/projects/show"
    end
  end

  def completion
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    Task.complete(@task)
    redirect_to project_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:body)
  end

end
