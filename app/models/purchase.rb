class Purchase < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :price

  belongs_to :user
  belongs_to :city
#  has_one :city

  has_attached_file :picture, :styles => { :medium => "512x512>", :small => "256x256>", :thumb => "128x128" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
end
