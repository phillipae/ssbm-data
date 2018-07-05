# class Types::QueryType < Types::BaseObject
Types::QueryType = GraphQL::ObjectType.define do
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  name "Query"
  description "The query root for this schema"

  field :characters, !types[Types::CharacterType] do
    resolve -> (obj, args, ctx) { Character.all }
  end

end