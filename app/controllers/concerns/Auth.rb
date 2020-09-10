module Auth
  def encode_tokken(payload = {})
    exp = 24.hours.from_now
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decode_tokken(token)
    decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new decoded
  end
end
