class User < ActiveRecord::Base
    has_secure_password
    validates_uniqueness_of :email, :case_sensitive => false
    validates :password, :firstname, :lastname, :password_confirmation, presence: true
    validates :password, length: { minimum: 5 }
    has_many :orders
    has_many :reviews

    def self.authenticate_with_credentials(email, password)
        #Trim whitespace from front and pack
        email = email.strip
        user = User.find_by(email: email)
        if user && user.authenticate(password)
            return user
        end
        nil
    end
end
