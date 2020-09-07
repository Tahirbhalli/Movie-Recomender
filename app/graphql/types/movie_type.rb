module Types
  class MovieType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :poster_url, String, null: true
    field :description, String, null: true
    field :director_id, Integer, null: true
    field :director, DirectorType, null: true
  end
end
