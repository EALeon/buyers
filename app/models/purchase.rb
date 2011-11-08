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

  def self.search(n, p, c, my_id)
    sql_search_str = "Select * From purchases Where name Like ?"
    if p.nil? or p == ""
    else sql_search_str = sql_search_str + " And price <= " + p
    end
    if c.nil? or c == ""
    else
      sql_search_str = sql_search_str + " And city_id = " + c
    end
    if my_id.nil? or my_id == ""
    else
      sql_search_str = sql_search_str + " And user_id = " + my_id
    end
    @purchases = Purchase.find_by_sql [sql_search_str, "%#{n}%"]
  end
end
