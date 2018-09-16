class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :traveler_id, :start_date, :end_date
  has_many :attractions
end
