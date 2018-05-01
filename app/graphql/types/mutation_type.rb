Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createAuthor, Types::AuthorType do
    argument :first_name, types.String
    argument :last_name, types.String
    argument :birth_year, types.Int
    argument :is_alive, types.Boolean

    resolve ->(obj, args, ctx) { Author.create args.to_h }
  end
end
