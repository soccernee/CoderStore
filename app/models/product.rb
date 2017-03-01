class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def self.alphabetical
    order(name: :asc)
  end

  # FIRST TRY
  def discount_amount
    return 0.41 if price_vnd > 800_000
    return 0.31 if price_vnd > 200_000
    return 0.21 if price_vnd > 100_000
    0
  end

  def final_price_raw
    price_vnd * (1 - discount_amount)
  end

  # Read Float#round method: https://ruby-doc.org/core-2.1.2/Float.html#method-i-round
  def final_price
    final_price_raw.round(-4)
  end

  def on_sale?
    discount_amount > 0
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end
end
