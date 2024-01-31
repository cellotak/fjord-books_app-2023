# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    title { 'test' }
    content { 'This is test' }
    association :user
  end
end
