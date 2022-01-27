FactoryBot.define do
  factory :user do
    name { Faker::Name }
    bio { Faker::Lorem.words(number: 10) }
    photo { Faker::LoremPixel.image(size: '50x60') }
    email { Faker::Internet.email }
    password { 'abcdef' }
    posts_counter { 0 }
    role { 'admin' }
    id { 1 }
    created_at { Faker::Date }
    updated_at { Faker::Date }
  end
end
