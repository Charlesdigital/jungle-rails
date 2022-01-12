RSpec.describe User, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"
    describe 'Validations' do
      # Initial test to ensure that when all fields are present, user is created
      it 'should create a new user when all fields are added' do
        @user = User.new(
          first_name: 'First',
          last_name: 'Last',
          email: 'test@gmail.com',
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

      #2. Validates that user has a last name
      it 'should not be valid without a last name' do
        @user = User.new(
          first_name: 'First',
          last_name: nil,
          email: 'test@email.com',
          password: '123',
          password_confirmation: '123'
        )
        expect(@user).to_not be_valid
      end

      #3. Validates that user has an email
      it 'should not be valid without an email' do
        @user = User.new(
          first_name: 'First',
          last_name: 'Last',
          email: nil,
          password: '123',
          password_confirmation: '123'
        )
        expect(@user).to_not be_valid
      end

      #4. Validates that user has a password
      it 'should not be valid without a password' do
        @user = User.new(
          first_name: 'First',
          last_name: 'Last',
          email: 'test@email.com',
          password: nil,
          password_confirmation: '123'
        )
        expect(@user).to_not be_valid
      end

      #5. Validates that user has added password confirmation
      it 'should not be valid without a password confirmation' do
        @user = User.new(
          first_name: 'First',
          last_name: 'Last',
          email: 'test@email.com',
          password: '123',
          password_confirmation: nil
        )
        expect(@user).to_not be_valid
      end

      #6. It should throw an error when password confirmation does not match
      it 'should not be valid if password is different' do
        @user = User.new(
          first_name: 'First',
          last_name: 'Last',
          email: 'test@email.com',
          password: '123',
          password_confirmation: '1234'
        )
        expect(@user).to_not be_valid
      end

    end
  end