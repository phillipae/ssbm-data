# example query for testing at
# localhost/query via POST with e.g. postman:
# {"query": "{ characters { title } }" }
CharacterType = GraphQL::ObjectType.define do
 name "Character"
  description "A Character"
  field :id, types.ID
  field :title, types.String
  field :rank, types.Int
  field :air_acceleration_base, types.Float
  field :air_acceleration_additional, types.Float
  field :air_acceleration_max, types.Float
  field :air_friction, types.Float
  field :air_speed, types.Float
  field :fall_speed_base, types.Float
  field :fall_speed_fast, types.Float
  field :gravity, types.Float
  field :weight, types.Int
  field :jump do
    type JumpType
    resolve -> (character, args, ctx) {
      character.jump
    }
  end
end