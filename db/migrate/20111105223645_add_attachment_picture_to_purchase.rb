class AddAttachmentPictureToPurchase < ActiveRecord::Migration
  def self.up
    add_column :purchases, :picture_file_name, :string
    add_column :purchases, :picture_content_type, :string
    add_column :purchases, :picture_file_size, :integer
    add_column :purchases, :picture_updated_at, :datetime
  end

  def self.down
    remove_column :purchases, :picture_file_name
    remove_column :purchases, :picture_content_type
    remove_column :purchases, :picture_file_size
    remove_column :purchases, :picture_updated_at
  end
end
