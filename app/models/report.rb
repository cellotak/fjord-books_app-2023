# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :mentioning_relationships, class_name: 'MentionRelation', foreign_key: :mentioning_report_id, dependent: :destroy
  has_many :mentioning_reports, through: :mentioning_relationships, source: :mentioned_report

  has_many :mentioned_relationships, class_name: 'MentionRelation', foreign_key: :mentioned_report_id, dependent: :destroy
  has_many :mentioned_reports, through: :mentioned_relationships, source: :mentioning_report

  validates :title, presence: true
  validates :content, presence: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end

  def create_mention_relation
    new_mentioned_report_ids = content.scan(%r{http:\/\/127.0.0.1:3000\/reports\/(\d+)}).map { |captured_str| captured_str[0].to_i }
    current_mentioned_report_ids = mentioning_reports.map(&:id)

    addition_report_ids = new_mentioned_report_ids - current_mentioned_report_ids
    deletion_report_ids = current_mentioned_report_ids - new_mentioned_report_ids

    deletion_report_ids.each do |mentioned_report_id|
      MentionRelation.find_by(mentioned_report_id:).destroy
    end
    addition_report_ids.each do |mentioned_report_id|
      MentionRelation.create(mentioning_report_id: id, mentioned_report_id:)
    end
  end
end
