class Review < ApplicationRecord
  belongs_to :user
  belongs_to :racket
  has_many :comments
  has_many :users, through: :comments
  
  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :racket, uniqueness: {scope: :user_id, message: "has already been reviewed by this user"}

  scope :five_stars, -> {where("stars > '4'")}
  #scope :five_stars_alpha, -> {five_stars.order(:racket_id)}
end
