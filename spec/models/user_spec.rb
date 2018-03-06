require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new
      @user.password = 'correct_password'
      @user.password_confirmation = 'correct_password'
      @user.firstname = 'hello'
      @user.lastname = 'world'
      @user.email = 'newemail@gmail.com'
    end
    after(:each) do
      User.delete_all
    end
      it 'should require both a password and password_confirmation' do
        @user.save
        expect(@user).to be_valid
      end
      it 'should require both a password_confirmation' do
        @user.password_confirmation = nil
        @user.save
        expect(@user.errors[:password_confirmation]).to include("can't be blank")
      end
      it 'should require the password_confirmation to match password' do
        @user.password_confirmation = 'wrong_password'
        @user.save
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it 'should require the password to match password_confirmation' do
        @user.password = 'wrong_password'
        @user.save
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it 'should require a password and password_confirmation to match with case sensitivity' do
        @user.password_confirmation = 'Correct_password'
        @user.save
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it 'should require a password and password_confirmation to be of minimum length 5' do
        @user.password = 'hell'
        @user.password_confirmation = 'hell'
        @user.save
        expect(@user.errors[:password]).to include("is too short (minimum is 5 characters)")
      end
      it 'validate the user inputted the correct credentials' do
        @user.save
        login_attempt = User.authenticate_with_credentials(@user.email, 'incorrect_password')
        expect(login_attempt).to eql(nil)
      end
      it 'should validate the user inputted the correct credentials' do
        @user.save
        login_attempt = User.authenticate_with_credentials(@user.email, @user.password)
        expect(login_attempt).to eql(@user)
      end
      it 'validate the user inputted the correct credentials with whitespace before/after email' do
        @user.save

        login_attempt = User.authenticate_with_credentials('   ' + @user.email + '      ', @user.password)
        expect(login_attempt).to eql(@user)
      end
      it 'validate the user inputted the incorrect credentials with whitespace before/after password' do
        @user.save

        login_attempt = User.authenticate_with_credentials(@user.email, '   ' + @user.password + '     ')
        expect(login_attempt).to eql(nil)
      end
      it 'should validate unique email (case-insensitive)' do
        user2 = User.new
        user2.password = @user.password
        user2.password_confirmation = @user.password_confirmation
        user2.firstname = @user.firstname
        user2.lastname = @user.lastname
        user2.email = @user.email.upcase
        user2.save

        user3 = User.new
        user3.password = @user.password
        user3.password_confirmation = @user.password_confirmation
        user3.firstname = @user.firstname
        user3.lastname = @user.lastname
        user3.email = @user.email.titleize
        user3.save

        @user.save
        expect(user3.errors[:email]).to include("has already been taken")
        expect(@user.errors[:email]).to include("has already been taken")
      end
  end
end
