module Types
  class GenersofmovieType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :movies, [MovieType], null: true
  end
end
