class Mutations::DeleteAuthor < GraphQL::Function
  argument :id, types.ID

  type types.Boolean

  def call(obj, args, ctx)
    Author.find(args[:id]).destroy ? true : false
  end
end
