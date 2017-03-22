class AddThumbnailToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :thumbnail, :oid
  end
end
