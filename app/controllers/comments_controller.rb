class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @timeline = Timeline.(params[:timeline_id])
    @comment = @timeline.comments
  end

  def show
  end

  def new
    @comment = Comment.new
    @timeline = Timeline.find(params[:timeline_id])
  end

  def edit
  end

  def create
    # @timeline = Timeline.find(params[:timeline_id])
    @comment = @timeline.comments.build(comment_params)
    # @comment.user = current_user
    @comment = Comment.new
      if @comment.save
        redirect_to @comment, notice: 'Comment was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
      if @comment.update(comment_params)
        redirect_to @comment, notice: 'Comment was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :photo_id, :timeline_id, :user_id)
    end
end
