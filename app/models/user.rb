class User < ActiveRecord::Base
    has_secure_password
    validates_uniqueness_of :email, :case_sensitive => false
    validates :password, :firstname, :lastname, :password_confirmation, presence: true
    has_many :orders
    has_many :reviews
end
