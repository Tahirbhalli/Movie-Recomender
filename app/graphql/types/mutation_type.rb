module Types
  class MutationType < Types::BaseObject
    field :signin_mutation, mutation: Mutations::SigninMutation,
                            description: 'Login And get a Json Web Tokken'
    field :create_user, mutation: Mutations::CreateUserMutation,
                        description: 'Signup And get a Json Web Tokken'
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
