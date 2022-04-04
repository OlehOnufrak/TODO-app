FactoryBot.define do
  factory :invite do
    my_audience
    id    { 1000000 + rand(10000)}
    token { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
  end
end
