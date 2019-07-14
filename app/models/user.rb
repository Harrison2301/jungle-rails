class User < ActiveRecord::Base
    has_secure_password
    validates :email, :password, :password_digest, presence: true
    validates_uniqueness_of :email
end