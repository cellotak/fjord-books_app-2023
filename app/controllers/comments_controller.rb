class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create show] 
  
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to [@commentable, @comment], notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def show
    @comment = @commentable.comments.find(params[:id])
  end

  private

  def comment_params
    params.require(:report).permit(:content)
  end

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

end
