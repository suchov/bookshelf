Types::AuthorType = GraphQL::ObjectType.define do
  name "AuthorType"

  field :first_name, types.String
  field :last_name, types.String
  field :birth_year, types.Int
  field :is_alive, types.Boolean
  field :id, !types.ID # !not allow the field to be nil - always must have value

  field :full_name, types.String # custom added full name
end
