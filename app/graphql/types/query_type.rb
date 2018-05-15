Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  field :login, types.String do
    argument :email, types.String
    argument :password, types.String

    resolve ->(_, args, _) {
      user = User.where(email: args[:email]).first
      user.sessions.create.key if user.try(:authenticate, args[:password])
    }
  end

  # TODO: remove me
  field :testField, types.String do
    argument :name, types.String, "Enter your name here"
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      # Rails.logger.info obj.inspect
      # Rails.logger.info ctx.inspect
      # http://www.rubydoc.info/github/rmosolgo/graphql-ruby/GraphQL/Query/Context
      "Hello #{ args[:name]}!"
    }
  end

  field :current_user, Types::UserType do
    resolve ->(_, _, ctx) {ctx[:current_user]}
  end

  field :author, Types::AuthorType do
    argument :id, types.ID, "The id of the author to retreve"
    description "One author"
    resolve ->(obj, args, ctx) {
      Author.where(id: args[:id]).first
    }
  end

  field :all_authors, types[Types::AuthorType] do
    is_public true
    description "All the authors in the database"
    resolve ->(_, _, _){ Author.all }
  end
end
