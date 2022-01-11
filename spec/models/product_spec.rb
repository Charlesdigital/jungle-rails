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

# 1. Validates : name, presence: tue
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

    end
end