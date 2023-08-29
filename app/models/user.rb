# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :validate_file_type
  has_one_attached :avatar

  private

  def validate_file_type
    return unless avatar.attached?
    errors.add(:avatar, I18n.t('errors.messages.file_type_not_image')) if !image?

  end

  def image?
    %w[image/jpg image/jpeg image/gif image/png].include?(avatar.blob.content_type)
  end
end