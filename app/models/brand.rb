class Brand < ApplicationRecord
    has_many :rackets

    validates :name, presence: true

    scope :alphabetical, -> {order(:name)}
end
