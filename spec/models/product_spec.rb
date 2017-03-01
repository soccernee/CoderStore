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

  describe "#discount_amount" do
    before do
      @product = Product.new
    end

    it "Hats that cost > 100,000 VND are going to be 21% off" do
      @product.price_vnd = 100_001
      expect(@product.discount_amount).to be_within(0.001).of(0.21)
    end

    it "Hats that cost > 200,000 VND are going to be 31% off" do
      @product.price_vnd = 200_001
      expect(@product.discount_amount).to be_within(0.001).of(0.31)
    end

    it "Hats that cost > 800,000 VND are going to be 41% off" do
      @product.price_vnd = 800_001
      expect(@product.discount_amount).to be_within(0.001).of(0.41)
    end
  end

  describe "#final_price_raw" do
    let(:product) { Product.new }
    it "is total - discount_amount" do
      product.price_vnd = 10_000
      expect(product.final_price_raw).to eq 10_000

      product.price_vnd = 100_001
      expect(product.final_price_raw).to be_within(0.001).of(100_001 * (1 - 0.21))

      product.price_vnd = 200_001
      expect(product.final_price_raw).to be_within(0.001).of(200_001 * (1 - 0.31))

      product.price_vnd = 800_001
      expect(product.final_price_raw).to be_within(0.001).of(800_001 * (1 - 0.41))
    end
  end

  describe "#final_price" do
    let(:product) { Product.new }

    it "rounds 115000 to 120,000" do
      # We don't  need to test the discount calculation here
      # Read "Method Stubs" at (docs: https://www.relishapp.com/rspec/rspec-mocks/docs)
      allow(product).to receive(:final_price_raw) { 115_000 }
      expect(product.final_price).to eq 120_000
    end

    it "rounds 114000 to 110,000" do
      allow(product).to receive(:final_price_raw) { 114_000 }
      expect(product.final_price).to eq 110_000
    end
  end
end
