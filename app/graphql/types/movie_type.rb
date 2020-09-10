module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :poster_url, String, null: true
    field :description, String, null: true
    field :director_id, Integer, null: true
    field :director, DirectorType, null: true
    field :movie_images, [MovieImageType], null: true
    field :stars, [StarType], null: true
    field :genersofmovies, [GenersofmovieType], null: true
  end
end
