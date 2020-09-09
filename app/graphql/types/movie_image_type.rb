module Types
  class MovieImageType < Types::BaseObject
    field :id, ID, null: false
    field :image_url, String, null: true
    field :movie_id, Integer, null: true
    
  end
end
