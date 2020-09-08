module Mutations
  class ResetPasswordMutation < BaseMutation
    argument :tokken, String, required: true
    argument :oldpassword, String, required: true
    argument :newpassword, String, required: true

    type Boolean

    def resolve(tokken:, oldpassword:, newpassword:)
      hasheduser = decode_tokken(tokken)
      return false unless User.where(id: hasheduser['userid']).exists?

      @user = User.find(hasheduser['userid'])
      return false unless @user.authenticate(oldpassword)

      @user.update(password: newpassword)
      true
    end
  end
end
