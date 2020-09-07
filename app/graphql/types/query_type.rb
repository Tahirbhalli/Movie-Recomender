module Types
  class QueryType < Types::BaseObject
    include Auth
    field :user, Types::UserType, null: false, description: 'get the user by id'
    field :allmovies, [Types::MovieType], null: false, description: 'get all the movies'
    field :movie, Types::MovieType, null: false, description: 'get specfic Movie' do
      argument :id, Integer, required: true
    end
    field :allstars, [Types::StarType], null: false, description: 'get all the list of stars'
    field :star, Types::StarType, null: false, description: 'get specfic star' do
      argument :id, Integer, required: true
    end
    field :likedmovies, [Types::MovieType], null: false, description: 'get all the list of Like movies of the User' do
      argument :tokken, String, required: true
    end
    def likedmovies(tokken:)
      userid = decode_tokken(tokken)
      @user = User.find(userid['userid'])
      @user.movies
    end

    def movie(id:)
      Movie.find(id)
    end

    def star(id:)
      Star.find(id)
    end

    def user
      User.find(1)
    end

    def allmovies
      Movie.all
    end

    def allstars
      Star.all
    end
  end
end
