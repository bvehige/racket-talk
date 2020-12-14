class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_rackets, through: :reviews, source: :racket
    has_many :rackets 
    has_secure_password

    #validates :username, uniqueness: true, prescence: true
end
