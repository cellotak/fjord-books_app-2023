# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Alice' }
    email { 'hoge@example.com' }
    password { 'hogepass' }

    trait :without_name do
      name { nil }
    end

    trait :another do
      email { 'fuga@example.com' }
    end
  end
end
