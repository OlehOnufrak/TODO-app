FactoryBot.define do
  factory :user do
    email                 { "#{Faker::Name.first_name}@gmail.com" }
    password              { 'password' }
    password_confirmation { 'password' }
  end
end
