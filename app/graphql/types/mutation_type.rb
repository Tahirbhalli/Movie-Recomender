module Types
  class MutationType < Types::BaseObject
    # field :createsignin, mutation: Mutations::SignIn
    field :create_user_mutation, mutation: Mutations::CreateUserMutation
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
