class Racket < ApplicationRecord
  belongs_to :brand
  belongs_to :user #change this naming convention to reduce confusion.  
  has_many :reviews
  has_many :users, through: :reviews #users who have reviewed it
  has_one_attached :image
  #accepts_nested_attributes_for :brand

  validates :racket_name, presence: true
  validates :racket_name, uniqueness: {scope: :brand, message: "has already been created for this brand"}
  #validate :not_duplicate

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}
  # scope :been_reviewed, -> {where }
  scope :search, -> (query){where("racket_name LIKE ?", "%#{query}%")}

  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
    self.brand
  end

  # def search(query)
  #   if Racket.search(query)
  #     Racket.search(query)
  #   elsif Brand.search(query)
  #     Brand.search(query)
  #   end

  # end

  def self.most_reviewed
    left_joins(:reviews).group(:racket_id)
  end

  def thumbnail
    self.image.variant(resize: "80x120")
  end

  # def avg_stars
  #   binding.pry
  #   if racket.reiews.count < 1
  #     puts "Not Yet Reviewed"
  #   else
  #   @stars = racket.reviews.average(:stars).to_i
  #   puts "Average Review is #{@stars}s"
  #   end

  # end

  def brand_and_racket 
    "#{racket_name} - #{brand.name} "
  end

end
