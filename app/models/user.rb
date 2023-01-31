class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }

  def self.authenticate_with_credentials (email,password) 
    @email = User.all.map{|user| user.email}
    @user = User.find_by_email(email.downcase.strip)
    if(@user && @user.authenticate(password))
      @user
    else
      nil
    end
  end
end
