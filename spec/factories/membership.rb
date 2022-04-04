FactoryBot.define do
  factory :membership do
    my_audience
    user
    id { 1000000 + rand(10000)}
  end
end
