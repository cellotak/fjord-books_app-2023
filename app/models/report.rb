# frozen_string_literal: true

require "validator/mention_validator.rb"

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :mentioning_relationships, class_name: 'MentionRelation', foreign_key: :mentioning_report_id, dependent: :destroy, inverse_of: :mentioning_report
  has_many :mentioning_reports, through: :mentioning_relationships, source: :mentioned_report

  has_many :mentioned_relationships, class_name: 'MentionRelation', foreign_key: :mentioned_report_id, dependent: :destroy, inverse_of: :mentioned_report
  has_many :mentioned_reports, through: :mentioned_relationships, source: :mentioning_report

  validates :title, presence: true
  validates :content, presence: true, mention: true

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end

  def create_mention_relation!
    new_mentioned_report_ids = content.scan(%r{http://127.0.0.1:3000/reports/(\d+)}).map { |captured_str| captured_str[0].to_i }

    new_mentioned_report_ids.each do |mentioned_report_id|
      mention_relation = mentioning_relationships.new(mentioned_report_id:)
      mention_relation.save!
    end
  end

  def update_mention_relation!
    new_mentioned_report_ids = content.scan(%r{http://127.0.0.1:3000/reports/(\d+)}).map { |captured_str| captured_str[0].to_i }
    old_mentioned_report_ids = mentioning_reports.map(&:id)

    addition_report_ids = new_mentioned_report_ids - old_mentioned_report_ids
    deletion_report_ids = old_mentioned_report_ids - new_mentioned_report_ids

    deletion_report_ids.each do |mentioned_report_id|
      mentioning_relationships.find_by(mentioned_report_id:).destroy!
    end

    addition_report_ids.each do |mentioned_report_id|
      mention_relation = mentioning_relationships.new(mentioned_report_id:)
      mention_relation.save!
    end
  end

  def save_with_mention_ralation
    ApplicationRecord.transaction do
      self.save!
      self.create_mention_relation!
    end
  end 

  def update_with_mention_relation(report_params)
    ApplicationRecord.transaction do 
      self.update(report_params)
      self.update_mention_relation!
    end
  end
end
