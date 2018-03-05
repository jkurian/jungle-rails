require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @product = Product.new
      @category = Category.new
      @category.name = 'Shoes'
      @category.save
    end
      it 'should save to database correctly' do
        @product.category = Category.create(name: 'Shoe')
        @product.name = "Adidas"
        @product.price = 109.99
        @product.quantity = 20
        @product.save
        
        expect(@product).to be_valid
      end
      it 'should validate missing name' do
        @product.name = ''
        @product.valid?
        expect(@product.errors[:name]).to include("can't be blank")
      end
      it 'should validate presence of name' do
        @product.name = 'John'
        @product.valid?
        expect(@product.errors[:name]).to include()
      end
      it 'should validate wrong type for price' do
        @product.price = ''
        @product.valid?
        expect(@product.errors[:price]).to include("is not a number")
      end
      it 'should validate missing price' do
        @product.price = 
        @product.valid?
        expect(@product.errors[:price]).to include("can't be blank")
      end
      it 'should validate presence of price' do
          @product = Product.new
          @product.price = 22.22
          @product.valid?
          expect(@product.errors[:price]).to include()
      end
      it 'should validate missing quantity' do
        @product.quantity = ''
        @product.valid?
        expect(@product.errors[:quantity]).to include("can't be blank")
      end
      it 'should validate presence of quantity' do
          @product.quantity = 22
          @product.valid?
          expect(@product.errors[:quantity]).to include()
      end
      it 'should validate missing category' do
        @product.category_id = 
        @product.valid?
        expect(@product.errors[:category]).to include("can't be blank")
      end
      it 'should validate presence of category id' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors[:category]).to include()
      end
  end
end
