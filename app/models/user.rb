class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :firstname, :lastname, :email, :date_of_birth, :password, :password_confirmation, :remember_me #, :city
  # Nested attributes
  validates_presence_of :user_name
  validates_uniqueness_of  :user_name
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :date_of_birth
 
#  has_many :purchases, :dependent => :destroy
  
end