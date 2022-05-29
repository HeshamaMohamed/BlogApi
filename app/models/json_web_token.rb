class JsonWebToken
  def self.encode(payload)
    # expiration = 30.minutes.from_now.to_i # making tokens expire after 30 mins
    # JWT.encode payload.merge(exp: expiration), Rails.application.secrets.secret_key_base
    JWT.encode payload, Rails.application.secrets.secret_key_base
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base).first
  end
end
