# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    sequence(:title) { |n| "report No.#{n}"}
    content { Faker::Lorem.sentence }
    association :user
  end
end
