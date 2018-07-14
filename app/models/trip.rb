class Trip < ApplicationRecord
  belongs_to :traveler
  belongs_to :attraction
end
