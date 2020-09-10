module Types
  class QueryType < Types::BaseObject
    include Auth
    field :getgenmovies, [Types::MovieType], null: false, description: 'get all the movies of Generes' do
      argument :genersid, Integer, required: true
    end
    def getgenmovies(genersid:)
      @gener = Genersofmovie.where(id: genersid).exists?
      if @gener
        g = Genersofmovie.find(genersid)
        g.movies
      else
        { id: 0 }
      end
    end
    field :allgeners, [Types::GenersofmovieType], null: false, description: 'get all the list of Generes'
    def allgeners
      Genersofmovie.all
    end
    field :dislike_a_geners, Boolean, null: false, description: 'User unfollow a geners' do
      argument :tokken, String, required: true
      argument :geners_id, Integer, required: true
    end
    def dislike_a_geners(tokken:, geners_id:)
      userid = decode_tokken(tokken)
      return false unless User.where(id: userid['userid']).exists?

      @user = User.find(userid['userid'])
      @g = Genersanduser.where(user_id: @user.id, genersofmovie_id: geners_id)
      if @g.exists?
        Genersanduser.delete(@g.ids)
        true
      else
        false
      end
    end
    field :like_a_geners, Boolean, null: false, description: 'User like a geners' do
      argument :tokken, String, required: true
      argument :geners_id, Integer, required: true
    end
    def like_a_geners(tokken:, geners_id:)
      userid = decode_tokken(tokken)
      return false unless User.where(id: userid['userid']).exists?

      @user = User.find(userid['userid'])
      if @user.genersandusers.create(genersofmovie_id: geners_id)
        true
      else
        false
      end
    end
    field :like_a_actor, Boolean, null: false, description: 'User like a star' do
      argument :tokken, String, required: true
      argument :actor_id, Integer, required: true
    end
    def like_a_actor(tokken:, actor_id:)
      userid = decode_tokken(tokken)
      return false unless User.where(id: userid['userid']).exists?

      @user = User.find(userid['userid'])
      if @user.starandusers.create(star_id: actor_id)
        true
      else
        false
      end
    end
    field :dislike_a_star, Boolean, null: false, description: 'User unfollow a star' do
      argument :tokken, String, required: true
      argument :star_id, Integer, required: true
    end
    def dislike_a_star(tokken:, star_id:)
      userid = decode_tokken(tokken)
      return false unless User.where(id: userid['userid']).exists?

      @user = User.find(userid['userid'])
      @g = Staranduser.where(user_id: @user.id, star_id: star_id)
      if @g.exists?
        Staranduser.delete(@g.ids)
        true
      else
        false
      end
    end
    field :likedgeners, [Types::GenersofmovieType], null: false,
                                                    description: 'get all the list of Liked geners of the User' do
      argument :tokken, String, required: true
    end
    def likedgeners(tokken:)
      userid = decode_tokken(tokken)
      if User.where(id: userid['userid']).exists?
        @user = User.find(userid['userid'])
        @user.genersofmovies
      else
        []
      end
    end
    field :likedActors, [Types::StarType], null: false, description: 'get all the list of Liked Actors of the User' do
      argument :tokken, String, required: true
    end
    def likedActors(tokken:)
      userid = decode_tokken(tokken)
      if User.where(id: userid['userid']).exists?
        @user = User.find(userid['userid'])
        @user.stars
      else
        []
      end
    end
    field :dislike_a_movie, Boolean, null: false, description: 'User unfollow a geners' do
      argument :tokken, String, required: true
      argument :movie_id, Integer, required: true
    end
    def dislike_a_movie(tokken:, movie_id:)
      userid = decode_tokken(tokken)
      return false unless User.where(id: userid['userid']).exists?

      @user = User.find(userid['userid'])
      @g = LikedMovie.where(user_id: @user.id, movie_id: movie_id)
      if @g.exists?
        LikedMovie.delete(@g.ids)
        true
      else
        false
      end
    end
    field :like_a_movie, Boolean, null: false, description: 'User like a movie' do
      argument :tokken, String, required: true
      argument :movie_id, Integer, required: true
    end
    def like_a_movie(tokken:, movie_id:)
      userid = decode_tokken(tokken)
      return false unless User.where(id: userid['userid']).exists?

      @user = User.find(userid['userid'])
      if @user.liked_movies.create(movie_id: movie_id)
        true
      else
        false
      end
    end
    field :likedmovies, [Types::MovieType], null: false, description: 'get all the list of Liked movies of the User' do
      argument :tokken, String, required: true
    end
    def likedmovies(tokken:)
      userid = decode_tokken(tokken)
      if User.where(id: userid['userid']).exists?
        @user = User.find(userid['userid'])
        @user.movies
      else
        []
      end
    end

    field :movie, Types::MovieType, null: false, description: 'get specfic Movie' do
      argument :id, Integer, required: true
    end
    def movie(id:)
      if Movie.where(id: id).exists?
        Movie.find(id)
      else
        {
          id: 0
        }
      end
    end

    field :star, Types::StarType, null: false, description: 'get specfic star' do
      argument :id, Integer, required: true
    end
    def star(id:)
      if Star.where(id: id).exists?
        Star.find(id)
      else
        {
          id: 0
        }
      end
    end

    field :user, Types::UserType, null: false, description: 'get the user by id'
    def user
      User.find(1)
    end

    field :allmovies, [Types::MovieType], null: false, description: 'get all the movies'
    def allmovies
      Movie.all
    end

    field :allstars, [Types::StarType], null: false, description: 'get all the list of stars'
    def allstars
      Star.all
    end
  end
end
