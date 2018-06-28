Types::CharacterType = GraphQL::ObjectType.define do
  name 'Character'

  field :id, !types.ID
  # field :title, !types.String
  # field :rank, !types.Int
end