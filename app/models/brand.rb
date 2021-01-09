class Brand < ApplicationRecord
    has_many :rackets

    validates :name, presence: true

    scope :alphabetical, -> {order(:name)}
    scope :search, -> (query){where("name LIKE ?", "%#{query}%")}
end
