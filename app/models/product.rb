class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :name, presence: true

  def image_path_or_image
    image_path.presence || image
  end
end
