Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createAuthor, function: Mutations::CreateAuthor.new
end
