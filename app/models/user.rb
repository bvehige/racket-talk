class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_rackets, through: :reviews, source: :racket
    has_many :rackets #that user has created
    has_secure_password

    validates :username, uniqueness: true, presence: true
    validates :password, presence: true
end
