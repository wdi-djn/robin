class User < ActiveRecord::Base
  has_many :gifts
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: REGEX }, uniqueness: { case_sensistive: false, message: 'Email already in use'}, :on => :create 
  validates :password, confirmation: true, length: { minimum: 6 }

  def self.confirm(params) 
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
