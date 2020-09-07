module Mutations
  class CreateUserMutation < BaseMutation
    # field :usercreate, Types::UserType, null: true
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(name:, email:, password:)
      @user = User.new(name: name, email: email, password: password)
      if @user.save
        @user
      else
        current_user
      end
    end
  end
end
