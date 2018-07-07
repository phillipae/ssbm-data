FactoryBot.define do
  factory :character do
    title                       { Faker::Ancient.hero }
    rank                        { Faker::Number.between(1, 30) }
    air_acceleration_base       { Faker::Number.between(0.01, 0.19) }
    air_acceleration_additional { Faker::Number.between(0.0125, 0.09) }
    air_acceleration_float      { Faker::Number.between(0.28, 0.0325) }
    air_friction                { Faker::Number.between(0.001, 0.05) }
    air_speed                   { Faker::Number.between(0.68, 1.35) }
    fall_speed_base             { Faker::Number.between(1.3, 3.1) }
    fall_speed_fast             { Faker::Number.between(1.6, 3.5) }
    gravity                     { Faker::Number.between(0.064, 0.25) }
    weight                      { Faker::Number.between(55, 140) }
  end
end