class Auth
  def self.issue(payload, secret_key)
    token = JWT.encode(payload, secret_key, "HS256")
  end
  def self.decode(token)
    token_decrypted = JWT.decode(token, "HS256")
  end
end
