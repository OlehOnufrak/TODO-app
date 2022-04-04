FactoryBot.define do
  factory :todo_item do
    todo_list
    id    { 1000000 + rand(10000)}
    title { Faker::Lorem.paragraph_by_chars(number: rand(0..25)) }
  end
end
