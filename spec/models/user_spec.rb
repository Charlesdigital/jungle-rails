require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
    #   Initial test
      it 'should create a new user when all fields are filled' do
        @user = User.new(
          first_name: 'First',
          last_name: 'Last',
          email: 'test@email.com',
          password: '123',
          password_confirmation: '123'
        )
        expect(@user).to be_valid
        end
    #1. Validates that user has a first name
    it 'should not be valid without a first name' do
        @user = User.new(
          first_name: nil,
          last_name: 'Last',
          email: 'test@email.com',
          password: '123',
          password_confirmation: '123'
        )
        expect(@user).to_not be_valid
      end
    end
end