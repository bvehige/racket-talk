class Racket < ApplicationRecord
  belongs_to :brand
  belongs_to :user #who created it
  has_many :reviews
  has_many :users, through: :reviews #users who have reviewed it
  #accepts_nested_attributes_for :brand

  validates :racket_name, presence: true
  validates :racket_name, uniqueness: {scope: :brand, message: "has already been created for this brand"}
  #validate :not_duplicate

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}
  # scope :been_reviewed, -> {where }

  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
    self.brand
  end

  def avg_stars
    binding.pry
    if racket.reiews.count < 1
      puts "Not Yet Reviewed"
    else
    @stars = racket.reviews.average(:stars).to_i
    puts "Average Review is #{@stars}s"
    end

  end


  # def not_duplicate
  #   #if brand and racket_name already exist, show an error message
  #   racket = Racket.find_by(racket_name: racket_name, brand_id: brand_id)
  #   if !!racket && racket !=self 
  #     errors.add(:racket_name, 'already exists with that brand')
  #   end
  # end

  def brand_and_racket 
    "#{racket_name} - #{brand.name} "
  end


end
