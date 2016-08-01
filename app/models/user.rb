class User < ApplicationRecord
    validates :email, presence: true
    has_secure_password
    has_many :vacations
    has_many :photos, through: :vacations
end
