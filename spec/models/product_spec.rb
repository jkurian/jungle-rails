require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    describe 'All fields input' do 
      it 'should save to database correctly' do
        product = Product.new
        product.name = "Adidas"
        product.price = 109.99
        product.quantity = 20
        product.save

        product.errors.full_messages.should include()
      end
    end
    describe 'Name' do 
      it 'should validate missing name' do
        product = Product.new
        product.name = ''
        product.valid?
        product.errors[:name].should include("can't be blank")
      end
      it 'should validate presence' do
        product = Product.new
        product.name = 'John'
        product.valid?
        product.errors[:name].should include()
      end
    end
    describe 'price' do 
      it 'should validate missing price' do
        product = Product.new
        product.price = ''
        product.valid?
        product.errors[:price].should include("is not a number")
      end
      it 'should validate presence of' do
          product = Product.new
          product.price = 22
          product.valid?
          product.errors[:price].should include()
      end
    end
    describe 'quantity' do 
      it 'should validate missing quantity' do
        product = Product.new
        product.quantity = ''
        product.valid?
        product.errors[:quantity].should include("can't be blank")
      end
      it 'should validate presence of' do
          product = Product.new
          product.quantity = 22
          product.valid?
          product.errors[:quantity].should include()
      end
    end
    describe 'category' do 
      it 'should validate missing category' do
        product = Product.new
        product.category_id = 
        product.valid?
        product.errors[:category].should include("can't be blank")
      end
      it 'should validate presence of' do
        category = Category.new
        category.name = 'Shoes'
        category.save
        product = Product.new
        product.category_id = 1
        product.valid?
        product.errors[:category].should include()
      end
    end
  end
end
