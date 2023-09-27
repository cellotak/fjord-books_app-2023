# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create show destroy]
  before_action :set_comment, only: %i[show destroy]
  before_action :ensure_current_user, only: %i[destroy]

  def show; end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to @commentable, alert: t('controllers.comment.no_content')
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def ensure_current_user
    redirect_to @commentable, alert: t('controllers.common.alert_unauthorized_operation') if current_user != @comment.user
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
