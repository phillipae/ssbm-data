# example query for testing at
# localhost/query via POST with e.g. postman:
# {"query": "{ characters { title } }" }
CharacterType = GraphQL::ObjectType.define do
 name "Character"
  description "A Character"
  field :id, types.ID
  field :title, types.String
  field :rank, types.Int
end