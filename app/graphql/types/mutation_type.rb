module Types
  class MutationType < Types::BaseObject

    field :signin_mutation, mutation: Mutations::SigninMutation
    field :create_user, mutation: Mutations::CreateUserMutation
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
