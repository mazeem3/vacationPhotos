class Vacation < ApplicationRecord
    belongs_to :user
    has_many :photos
    validates :name
end
