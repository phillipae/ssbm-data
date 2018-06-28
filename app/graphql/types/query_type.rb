# class Types::QueryType < Types::BaseObject
Types::QueryType = GraphQL::ObjectType.define do
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :allCharacters, !types[Types::CharacterType] do
    resolve -> (obj, args, ctx) { Character.all }
  end

end