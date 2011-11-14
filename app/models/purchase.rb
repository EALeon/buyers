class Purchase < ActiveRecord::Base
  attr_accessible :name, :description, :price, :user_id, :city_id, :picture
  validates_presence_of :name
  validates_numericality_of :price

  belongs_to :user
  belongs_to :city

  has_attached_file :picture, :styles => { :medium => "512x512>", :small => "256x256>", :thumb => "128x128" },
    :url  => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
  acts_as_commentable
  acts_as_votable

  scope :by_name, lambda{|name| where("name Like ?", name)}
  scope :by_price, lambda{|price| where("price <= ?", price) }
  scope :by_city, lambda{|city_id| where("city_id = ?", city_id) }
  scope :by_user, lambda{|user_id| where("user_id = ?", user_id) }

end
