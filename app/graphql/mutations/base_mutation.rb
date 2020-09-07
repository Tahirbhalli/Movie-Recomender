module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    def encode_tokken(payload={})
        exp=24.hours.from_now
        payload[:exp] = exp.to_i
        JWT.encode(payload,Rails.application.secrets.secret_key_base)

    end
    # def decode_tokken(token)
    #     decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    #     HashWithIndifferentAccess.new decoded
    # end
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject
  end
end
