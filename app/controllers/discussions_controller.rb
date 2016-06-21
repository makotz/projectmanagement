class DiscussionsController < ApplicationController
  before_action :locate_discussion, only: [:edit, :update, :destroy]

  def create
    @task = Task.new
    @discussion = Discussion.new discussion_params
    @project = Project.find params[:project_id]
    @discussion.project = @project
    if @discussion.save
      redirect_to project_path(@project)
    else
      render "/projects/show"
    end
  end

  def edit
  end

  def update
    @project = Project.find @discussion.project_id
    if @discussion.update discussion_params
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find @discussion.project_id
    @discussion.destroy
    redirect_to project_path(@project)
  end

  private

  def locate_discussion
    @discussion = Discussion.find params[:id]
  end

  def discussion_params
    params.require(:discussion).permit(:title, :body)
  end

end
