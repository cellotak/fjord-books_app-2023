module CommentsHelper
  def commentable_comment_path(comment)
    if @comment.commentable_type == "Report"
      report_comment_path(comment.commentable, comment)
    elsif @comment.commentable_type == "Book"
      book_comment_path(comment.commentable, comment)
    end
  end
end
