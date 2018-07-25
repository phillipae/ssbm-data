QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  field :characters do
    type types[CharacterType]
    resolve -> (obj, args, ctx) {
      Character.all
    }
  end
  field :jumps do
    type types[JumpType]
    resolve -> (obj, args, ctx) {
      Jump.all
    }
  end
end