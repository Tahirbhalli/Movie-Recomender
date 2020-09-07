module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :user, Types::UserType, null: false, description: 'get the user by id'
    field :movies, [Types::MovieType], null: false, description: 'get all the movies'
    # Ex:- :null => false
    def user()
      User.find(1)
    end
    def movies
      Movie.all
    end
  end
end
