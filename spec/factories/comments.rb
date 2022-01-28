FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.words(number: 20) }
    posts_id { nil }
    user_id { nil }
    created_at { Faker::Date }
    updated_at { Faker::Date }
  end
end
