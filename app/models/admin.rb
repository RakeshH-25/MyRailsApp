class Admin < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  after_destroy :ensure_an_admin_remains
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_length_of :password, :within => 6..20, :too_long => "pick a shorter password", :too_short => "pick a longer password"
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.passowrd_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.passowrd_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, passowrd_salt)
    end
  end

  private
    def ensure_an_admin_remains
      if Admin.count.zero?
      raise "Can't delete last Admin"
      end
    end
end
