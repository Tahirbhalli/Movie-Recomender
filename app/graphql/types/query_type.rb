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
    field :likedmovies, [Types::MovieType], null: false, description: 'get all the list of Liked movies of the User' do
      argument :tokken, String, required: true
    end
    field :likedactors, [Types::StarType], null: false, description: 'get all the list of Liked Actors of the User' do
      argument :tokken, String, required: true
    end
    field :likedgeners, [Types::StarType], null: false, description: 'get all the list of Liked geners of the User' do
      argument :tokken, String, required: true
    end
    field :like_a_geners, Boolean, null: false, description: 'User like a geners' do
      argument :tokken, String, required: true
      argument :geners_id, Integer, required: true
    end
    field :unfollow_a_geners, Boolean, null: false, description: 'User unfollow a geners' do
      argument :tokken, String, required: true
      argument :geners_id, Integer, required: true
    end
    def unfollow_a_geners(tokken:, geners_id:)
      userid = decode_tokken(tokken)
      @user = User.find(userid['userid'])
      @g = Genersanduser.find_by(user_id: @user.id, genersofmovie_id: geners_id)
      if Genersanduser.delete(@g.id)
        true
      else
        false
      end
    end

    def like_a_geners(tokken:, geners_id:)
      userid = decode_tokken(tokken)
      @user = User.find(userid['userid'])
      if @user.genersandusers.create(genersofmovie_id: geners_id)
        true
      else
        false
      end
    end

    def likedgeners(tokken:)
      userid = decode_tokken(tokken)
      @user = User.find(userid['userid'])
      @user.genersofmovies
    end

    def likedactors(tokken:)
      userid = decode_tokken(tokken)
      @user = User.find(userid['userid'])
      @user.stars
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
