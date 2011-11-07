class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :firstname, :lastname, :email, :date_of_birth, :password, :password_confirmation, :remember_me, :city_id
  # Nested attributes
  validates_presence_of :user_name
  validates_uniqueness_of :user_name

  has_many :purchases, :dependent => :destroy
  belongs_to :city
#  has_one :city

  accepts_nested_attributes_for :purchases
end
