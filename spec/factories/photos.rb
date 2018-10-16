FactoryBot.define do
  factory :photo do
    title { Faker::Book.title }
    description { "MyText" }
    user { Faker::Book.author }
  end
end
