# frozen_string_literal: true

module CommentsHelper
  def commentable_comment_path(comment)
    case comment.commentable_type
    when 'Report'
      report_comment_path(comment.commentable, comment)
    when 'Book'
      book_comment_path(comment.commentable, comment)
    end
  end

  def edit_commentable_comment_path(comment)
    case comment.commentable_type
    when 'Report'
      edit_report_comment_path(comment.commentable, comment)
    when 'Book'
      edit_book_comment_path(comment.commentable, comment)
    end
  end

  def commentable_model_name(comment)
    case comment.commentable_type
    when 'Report'
      Report.model_name.human.downcase
    when 'Book'
      Book.model_name.human.downcase
    end
  end
end
