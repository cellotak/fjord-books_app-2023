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
end
