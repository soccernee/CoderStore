# Generate rspec test with: `rails g rspec:helper products`
module ProductsHelper
  def product_discount_info(product)
    if product.on_sale?
      "More than #{(product.discount_amount.round(1) * 100).to_i}% off!"
    end
  end
end
