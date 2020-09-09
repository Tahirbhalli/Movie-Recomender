module Types
  class StarType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :pic_url, String, null: true
    field :description, String, null: true
    field :movies,[MovieType],null: true
  end
end
