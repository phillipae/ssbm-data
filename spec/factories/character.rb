FactoryBot.define do
  factory :character do
    title                       { Faker::Ancient.hero }
    rank                        { Faker::Number.between(1, 30) }
    air_acceleration_base       { Faker::Number.between(0.01, 0.19).truncate(2) }
    air_acceleration_additional { Faker::Number.between(0.0125, 0.09).truncate(4) }
    air_acceleration_max        { Faker::Number.between(0.28, 0.0325).truncate(4) }
    air_friction                { Faker::Number.between(0.001, 0.05).truncate(3) }
    air_speed                   { Faker::Number.between(0.68, 1.35).truncate(2) }
    fall_speed_base             { Faker::Number.between(1.3, 3.1).truncate(2) }
    fall_speed_fast             { Faker::Number.between(1.6, 3.5).truncate(2) }
    gravity                     { Faker::Number.between(0.064, 0.25).truncate(3) }
    weight                      { Faker::Number.between(55, 140) }
  end
end