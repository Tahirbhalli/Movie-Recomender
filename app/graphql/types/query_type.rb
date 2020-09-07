module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :user, Types::UserType, null: false, description: 'get the user by id'
    # Ex:- :null => false
    def user()
      User.find(1)
    end
  end
end
