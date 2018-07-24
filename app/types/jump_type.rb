# example query for testing at
# localhost/query via POST with e.g. postman:
# {"query": "{ jumps { jumpsquat } }" }
JumpType = GraphQL::ObjectType.define do
 name "Jump"
  description         "A Jump"
  field :id,            types.ID
  field :character_id,  types.ID
  field :jumpsquat,     types.Int
  field :max_jumps,     types.Int
  field :landing_lag,   types.Int
  field :jump_force,    types.Float
end