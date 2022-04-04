FactoryBot.define do
  factory :todo_list do
    user
    id    { 1000000 + rand(10000)}
    title { Faker::Lorem.paragraph_by_chars(number: rand(0..25)) }
  end
end
