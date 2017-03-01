require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProductsHelper. For example:
#
# describe ProductsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ProductsHelper, type: :helper do
  # Docs: https://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/helper-specs/helper-spec#helper-method-that-returns-a-value
  it "returns 'More than X% off' if on safe" do
    product = Product.new name: "Lover's Hat", price_vnd: 110_001
    expect(helper.product_discount_info(product)).to eq 'More than 20% off!'
  end
end
