require 'rails_helper'

RSpec.describe Product, type: :model do
  describe ".alphabetical" do
    it "returns [] without data" do
      expect(Product.alphabetical).to eq []
    end

    it "returns [a] when there's one product" do
      a = Product.new
      a.save(validate: false)
      expect(Product.alphabetical).to eq [a]
    end

    it "returns [a, b] in the correct order" do
      b = Product.create! name: 'B'
      a = Product.create! name: 'A'
      expect(Product.alphabetical).to eq [a, b]
    end

    it "returns [a, b, c] after I create c, b, a" do
      c = Product.create! name: 'C'
      b = Product.create! name: 'B'
      a = Product.create! name: 'A'
      expect(Product.alphabetical).to eq [a, b, c]
    end
  end
end
