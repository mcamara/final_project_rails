FactoryBot.define do
  factory :user do
    username { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    password "password"
    avatar { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'avataaars (1).png'), 'image/png') }
  end
end
