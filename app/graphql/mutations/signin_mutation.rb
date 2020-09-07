module Mutations
  class SigninMutation < BaseMutation

    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(email:,password:)
      @user = User.find_by(email: email)
      if @user.authenticate(password)
        @user
      else
        nil
      end
    end
  end
end
