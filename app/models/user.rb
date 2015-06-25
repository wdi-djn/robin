class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :welcome_new_user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :gifts
  has_many :contributions
  
  devise :omniauthable

  validates :first_name, presence: true
  validates :last_name, presence: true
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: REGEX }, uniqueness: { case_sensistive: false, message: 'Email already in use'}, :on => :create 

  def welcome_new_user
    UserMailer.new_user_email(self).deliver
    puts "//////////"
    puts "//////////"
    puts "//////////"
    puts "//////////"
    puts "//////////"
    puts "//////////"
    puts "NEW USER EMAIL SENT!"
  end
end
