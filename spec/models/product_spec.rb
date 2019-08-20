require 'rails_helper'

RSpec.describe Product, type: :product do
  it "is not valid without a name" do
    category = Category.create(name: "test")
    product = Product.create(name: "", price: 123, category: category)
    expect(product).to_not be_valid
  end

  it "is not valid with a nil name" do
    category = Category.create(name: "test")
    product = Product.create(name: nil, price: 123, category: category)
    expect(product).to_not be_valid
  end

  it "is not valid with a nil price" do
    category = Category.create(name: "test")
    product = Product.create(name: "test", price: nil, category: category)
    expect(product).to_not be_valid
  end

  it "is not valid with a invalid price" do
    category = Category.create(name: "test")
    product = Product.create(name: "test", price: "test", category: category)
    expect(product).to_not be_valid
  end
end
