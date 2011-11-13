class City < ActiveRecord::Base
  has_many :users
  has_many :purchases
  attr_accessible :name
  validates_uniqueness_of :name
end
