# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :mentioning_relationships, class_name: 'Mention', foreign_key: :mentioning_reports_id
  has_many :mentioning_reports, through: :mentioning_relationships, source: :mentioned_reports

  has_many :mentioned_relationships, class_name: 'Mention', foreign_key: :mentioned_reports_id
  has_many :mentioned_reports, through: :mentioned_relationships, source: :mentioning_reports
  
  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end
end
