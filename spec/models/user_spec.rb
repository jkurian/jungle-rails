require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      it 'should require both a password and password_confirmation' do
        user = User.new
        user.password = 'helloWord'
        user.firstname = 'hello'
        user.lastname = 'world'
        user.save
        expect(user.errors[:password_confirmation]).to include("can't be blank")
      end
      it 'should require a password and password_confirmation to not match' do
        user = User.new
        user.password = 'helloWord'
        user.firstname = 'hello'
        user.lastname = 'world'
        user.password_confirmation = 'hellowrold'
        user.save
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it 'should require a password and password_confirmation to match' do
        user = User.new
        user.password = 'helloWord'
        user.firstname = 'hello'
        user.lastname = 'world'
        user.password_confirmation = 'helloworld'
        user.save
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it 'should validate unique email (case-insensitive)' do
        user = User.new
        user.password = 'helloWorld'
        user.password_confirmation = 'helloWorld'
        user.firstname = 'hello'
        user.lastname = 'world'
        user.email = 'TEST@TEST.COM'
        user.save

        user2 = User.new
        user2.password = 'helloWorld'
        user2.password_confirmation = 'helloWorld'
        user2.firstname = 'hello'
        user2.lastname = 'world'
        user2.email = 'TEST@test.COM'
        user2.save

        expect(user2.errors[:email]).to include("has already been taken")
      end
  end
end
