class Purchase < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description

#  belongs_to :user
end
