require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'return true password and password_confirmation are same' do
      @user = User.create(name: "test", email: "test@test.com", password:"123456", password_confirmation:"123456")
      puts "test1.email #{User.all.map{|user| user.email}}"

      expect(@user).to be_valid
    end

    it 'return error message password and password_confirmation are not the same' do
      @user = User.create(name: "test", email: "test@test.com", password:"123456", password_confirmation:"b")
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'return error message email has been used' do
      @user = User.create(name: "test", email: "test@test.com", password:"123456", password_confirmation:"123456")
      @user1 = User.create(name: "test", email: "test@test.COM", password:"123456", password_confirmation:"123456")
      puts @user1.errors.full_messages
      expect(@user1).to_not be_valid
    end

    it 'return true email has not been used' do
      @user = User.create(name: "test", email: "test@test.com", password:"123456", password_confirmation:"123456")
      @user1 = User.create(name: "test", email: "test@test1.com", password:"123456", password_confirmation:"123456")
      expect(@user1).to be_valid
    end
    
    it 'return true email has not been used' do
      @user = User.create(name: "test", email: "test@test.com", password:"123456", password_confirmation:"123456")
      @user1 = User.create(name: "test", email: "test@test1.com", password:"123456", password_confirmation:"123456")
      expect(@user1).to be_valid
    end

    it 'return error message if name is nil' do
      @user = User.create(name: nil, email: "test@test.com", password:"123456", password_confirmation:"123456")
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'return error message if password is nil' do
      @user = User.create(name: "test", email: "test@test.com", password: nil, password_confirmation:"123456")
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it 'return error message if password length is lower 6' do
      @user = User.create(name: "test", email: "test@test.com", password: "12345", password_confirmation:"12345")
      puts @user.errors.full_messages
      expect(@user).to_not be_valid
    end
    
  end
  
  describe 'authenticate_with_credentials' do
  
    it 'return nil if password wrong' do
    
    @user=User.create(name: "test", email: "bob@bob.com", password: "123456", password_confirmation:"123456")
    
    puts "authenticate.user===> #{User.all.map{|user| user}}"

    result = User.authenticate_with_credentials("bob@bob.com","12345")
    expect(result).to be_nil
    end

    it 'return user if email and password are correct' do
    @user = User.create(name: "test", email: "test30@test.com", password: "123456", password_confirmation:"123456")
    
    result = User.authenticate_with_credentials(" Test30@test.coM ","123456")
    puts "authenticate.user===>#{result}"
    expect(result.email).to eq(@user.email)
    end
  
  end


end
