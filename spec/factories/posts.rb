FactoryBot.define do
  factory :post do
    title { Faker::Book }
    text { Faker::Lorem.words(number: 20) }
    comments_counter { 3 }
    likes_counter { 3 }
    user_id { 1 }
    created_at { Faker::Date }
    updated_at { Faker::Date }
  end
end
