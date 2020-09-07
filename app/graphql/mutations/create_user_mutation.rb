module Mutations
  class CreateUserMutation < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(name:, email:, password:)
      @user = User.new(name: name, email: email, password: password)
      @user if @user.save
    end
  end
end
