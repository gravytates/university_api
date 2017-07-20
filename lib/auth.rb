require 'jwt'

class Auth

  ALGORITHM = "HS256"

  def self.issue(payload, secret_key)
    token = JWT.encode(payload, auth_secret, ALGORITHM)
  end

  def self.decode(token)
    token_decrypted = JWT.decode(token,
                                auth_secret,
                                true,
                                { algorithm: ALGORITHM }).first
  end

private
  def self.auth_secret
    ENV["AUTH_SECRET"]
  end
end
