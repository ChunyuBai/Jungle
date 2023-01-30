require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'return true if it has own name, price, quantity, category' do
      @category = Category.new
      @category.name = "plant"
      @category.save
      @product = Product.new
      @product.name = "bamboo"
      @product.price_cents = 1000
      @product.quantity = 20 
      @product.category_id = @category.id
      @product.save
      puts @product.errors.full_messages
      expect(@product).to be_valid
    end

    it 'return erro messge if name is nil' do
      @category = Category.new
      @category.name = "plant"
      @category.save
      @product = Product.new
      @product.name = nil
      @product.price_cents = 1000
      @product.quantity = 20 
      @product.category_id = @category.id
      @product.save
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it 'return erro messge if quantity is nil' do
      @category = Category.new
      @category.name = "plant"
      @category.save
      @product = Product.new
      @product.name = "Bamboo"
      @product.price_cents = 1000
      @product.quantity = nil 
      @product.category_id = @category.id
      @product.save
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it 'return erro messge if price is nil' do
      @category = Category.new
      @category.name = "plant"
      @category.save
      @product = Product.new
      @product.name = "Bamboo"
      @product.price_cents = nil
      @product.quantity = 20 
      @product.category_id = @category.id
      @product.save
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end

    it 'return erro messge if category is nil' do
      @category = Category.new
      @category.name = "plant"
      @category.save
      @product = Product.new
      @product.name = "Bamboo"
      @product.price_cents = 1000
      @product.quantity = 20 
      @product.category_id = nil
      @product.save
      puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end
  end
end

