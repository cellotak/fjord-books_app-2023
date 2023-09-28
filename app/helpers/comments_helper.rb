# frozen_string_literal: true

module CommentsHelper
  def commentable_model_name(comment)
    case comment.commentable_type
    when 'Report'
      Report.model_name.human.downcase
    when 'Book'
      Book.model_name.human.downcase
    end
  end
end
