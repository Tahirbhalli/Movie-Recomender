module Mutations
  class SigninMutation < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type String

    def resolve(email:, password:)
      @user = User.find_by(email: email)
      if @user.authenticate(password)
        encode_tokken({ userid: @user.id })
      else
        encode_tokken(userid: 0)
      end
    end
  end
end
