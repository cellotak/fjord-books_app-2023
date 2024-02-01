# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'testpass' }

    trait :without_name do
      name { nil }
    end
  end
end
