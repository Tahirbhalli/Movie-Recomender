module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :password_digest, String, null: true
    # field :errors, Array, null: true
  end
end
