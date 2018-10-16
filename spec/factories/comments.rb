FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user { Faker::Book.author }
    photo { Faker::Avatar.image }
  end
end
