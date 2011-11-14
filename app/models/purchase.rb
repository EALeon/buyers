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

  class << self
    def search(n, p, c, my_id)
      price_str = "price <= ?"
      city_str = "city_id = ?"
      user_str = "user_id = ?"

      if p.blank?
        price_str = ""
      end
      if c.blank?
        city_str = ""
      end
      if my_id.blank?
        user_str = ""
      end

      scope :by_name, lambda{ where("name Like ?", "%#{n}%") }
      scope :by_price, lambda{ where(price_str, p) }
      scope :by_city, lambda{ where(city_str, c) }
      scope :by_user, lambda{ where(user_str, my_id) }

      @purchases = Purchase.by_name.by_price.by_city.by_user
    end
  end
end
