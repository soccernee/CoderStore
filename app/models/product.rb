class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :thumbnail, ThumbnailUploader
  validates :name, presence: true
  has_many :photos

  def image_path_or_image
    image_path.presence || image
  end
end
