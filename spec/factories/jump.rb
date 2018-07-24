FactoryBot.define do
  factory :jump do
    jumpsquat   { Faker::Number.between(3, 8) }
    max_jumps   { Faker::Number.between(2, 6) }
    landing_lag { Faker::Number.between(4, 6) }
    jump_force  { Faker::Number.between(1.6, 4.1).truncate(2) }

    if Rails.env == 'test'
      association :character, factory: :character
    end

  end
end