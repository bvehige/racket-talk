class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_rackets, through: :reviews, source: :racket
    has_many :rackets #that user has created
    
    validates :username, uniqueness: true, presence: true
    validates :email, presence: true

    has_secure_password

end
