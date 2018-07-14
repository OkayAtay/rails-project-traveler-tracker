class Traveler < ApplicationRecord
  has_secure_password
  has_many :trips
  has_many :attractions, through: :trips

  validates :name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
end
