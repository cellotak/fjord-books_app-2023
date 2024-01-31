FactoryBot.define do
  factory :user do
    name { 'Alice' }
    email { 'foo@example.com' }
    password { 'hogepass' }

    trait :without_name do
      name { nil }
    end
  end
end
