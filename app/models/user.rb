class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_rackets, through: :reviews, source: :racket
    has_many :rackets #that user has created
    has_many :comments
    has_many :commented_reviews, through: :comments, source: :reviews

    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    #validates :email, presence: true

    def self.create_by_google(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |user|
            user.password = SecureRandom.hex
        end
    end

    def self.create_by_github(auth)
        self.find_or_create_by(username: auth[:info][:nickname]) do |user|
            user.password = SecureRandom.hex
        end
    end


end
