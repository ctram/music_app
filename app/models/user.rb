class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, length: {minimum: 1, allow_nil: true}
  validates :password_digest, presence: {message: 'Must enter a password'}
  after_initialization :ensure_session_token

attr_reader :password

  def self.find_by_credentials(email, password)
    if email == '' or password == ''
      return nil
    end
    user = User.find_by(email: email)
    return nil if user.nil?
    password_digest = BCrypt::Password.new(user.password_digest)
    return user if password_digest.is_password?(password)
    nil
  end

  def User.generate_session_token
    session_token = SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    session_token = User.generate_session_token
    self.session_token = session_token
    self.save
    session_token
  end

  def ensure_session_token
    self.session_token || reset_session_token!
  end

end
