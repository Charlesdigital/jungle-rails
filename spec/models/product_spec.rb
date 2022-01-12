require 'rails_helper'

RSpec.describe Product, type: :model do
    describe 'Validations' do

      it 'should create a new product when all four fields are filled' do
        @category = Category.new(name: 'test 0')
        @product = Product.new(
          name: 'Test product',
          price: 24.95,
          quantity: 2,
          category: @category
        )
        # puts @product.inspect
        expect(@product).to be_valid
      end

# 1. Validates : name, presence: true
it 'should not pass without a name' do
    @category = Category.new(name: 'test 1')
    @product = Product.new(
      name: nil,
      price: 24.95,
      quantity: 2,
      category: @category
    )
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eq ["Name can't be blank"]
         end

# 2. Validates : price, presence: true
it 'should not pass without a price' do
    @category = Category.new(name: 'test 2')
    @product = Product.new(
      name: 'Test product',
      price: nil,
      quantity: 2,
      category: @category
    )
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
        end

# 3. Validates : quantity, presence: true
it 'should not be valid without quantity' do
    @category = Category.new(name: 'test 3')
    @product = Product.new(
      name: 'Test product',
      price: 24.95,
      quantity: nil,
      category: @category
    )
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
        end

# 4. Validates : category, presence: true
it 'should not be valid without a category' do
    @category = Category.new(name: 'test 4')
    @product = Product.new(
      name: 'Test product',
      price: 24.95,
      quantity: 2,
      category: nil
    )
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eq ["Category can't be blank"]
        end
    end
end