class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to [@commentable, @comment], notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def comment_params
    params.require(:report).permit(:content)
  end

end
