Types::AuthorInputType = GraphQL::InputObjectType.define do
  name 'AuthorInputType'
  description 'Properties for creaing or updating an Author'

  argument :first_name, types.String
  argument :last_name, types.String
  argument :birth_year, types.Int
  argument :is_alive, types.Boolean
end

Types::AuthorType = GraphQL::ObjectType.define do
  name 'AuthorType'
  field :first_name, types.String, description: 'The first name of the author'
  field :last_name, types.String
  field :birth_year, types.Int
  field :is_alive, types.Boolean
  field :id, !types.ID # !not allow the field to be nil - always must have value

  field :full_name, types.String do # custom graphql field
    description 'The full name of the author'
    resolve ->(o, _, _) { [o.first_name, o.last_name].compact.join(' ') }
  end

  field :coordinates, Types::PairType do
    description 'The coordinates of the author'
  end

  field :publication_years, types[types.Int]

  field :errors, types[types.String], 'Reasons object could not be saved' do
    resolve ->(obj, _, _) { obj.errors.to_a }
  end
end
