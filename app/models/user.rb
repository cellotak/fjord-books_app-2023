# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :validate_avatar_file_type
  has_one_attached :avatar

  private

  def validate_avatar_file_type
    return unless avatar.attached?

    errors.add(:avatar, I18n.t('errors.messages.file_type_not_image')) unless avatar_have_image?
  end

  def avatar_have_image?
    %w[image/jpg image/jpeg image/gif image/png].include?(avatar.blob.content_type)
  end
end
