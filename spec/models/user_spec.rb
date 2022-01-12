require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
    #   Initial test
      it 'should create a new user when all fields are filled' do
        @user = User.new(
          first_name: 'First',
          last_name: 'Last',
          email: 'test@gmail.com',
          password: '123',
          password_confirmation: '123'
        )
        expect(@user).to be_valid
        end

   it "Don't save user when passwords don't match" do
    user = User.new({
      first_name: 'bob',
      last_name: 'lee',
      email: 'test@gmail.com',
      password: '123',
      password_confirmation: '123'
    })
    user.save

    find_user = User.where(first_name: 'Melissa')
    puts "Find user: #{find_user.inspect}"
    expect(find_user).not_to exist
  end


    end
end