module Mutations
  class SignIn < BaseMutation
    field :user, String
    argument :name, String, required: false
    argument :password, String, required: false
  end
end
