module Auth
  def encode_tokken(payload = {})
    hmac_secret = 'my$ecretK3y'
    JWT.encode payload, hmac_secret, 'HS256'
  end

  def decode_tokken(token)
    JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
  end
end
