class CommentsController < ApplicationController
  before_action :comment_params, only: [:edit, :update]

  def create
    @comment = Comment.new comment_params
    @discussion = Discussion.find params[:discussion_id]
    @project = Project.find @discussion.project_id
    @comment.discussion = @discussion
    if @comment.save
      redirect_to project_path(@project)
    else
      render "/projects/show"
    end
  end


  def edit
  end

  def update
    @discussion = Discussion.find
    @project = Project.find @discussion.project_id
    @comment.discussion_id
    if @comment.update commment_params
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @discussion = Discussion.find @comment.discussion_id
    @project = Project.find @discussion.project_id
    @comment.destroy
    redirect_to project_path(@project)
  end

  private


  def comment_params
    params.require(:comment).permit(:body)
  end

end
