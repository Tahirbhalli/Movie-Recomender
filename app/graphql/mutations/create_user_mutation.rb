module Mutations
  class CreateUserMutation < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    type String

    def resolve(name:, email:, password:)
      @user = User.new(name: name, email: email, password: password)
      if @user.save
        encode_tokken({userid: @user.id})
      else
        ""
      end
    end
  end
end
