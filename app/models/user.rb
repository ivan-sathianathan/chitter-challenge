require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_hash, Text

  has n, :peeps, through: Resource

  validates_confirmation_of :password
  validates_uniqueness_of :email, :username
  validates_format_of :email, as: :email_address
  validates_presence_of :name, :email, :username, :password_confirmation

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user && BCrypt::Password.new(user.password_hash) == password ? user : nil
  end

end
