class AuthenticateUser
  def self.decode(token)
    
    JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256').first
  rescue JWT::DecodeError => e
    nil 
  end
end
