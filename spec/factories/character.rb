FactoryBot.define do
  factory :character do
    title { Faker::Ancient.hero }
    rank  { Faker::Number.between(1, 30) }
  end
end