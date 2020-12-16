class Brand < ApplicationRecord
    has_many :rackets

    validates :name, presence: true, uniqueness: true
end
