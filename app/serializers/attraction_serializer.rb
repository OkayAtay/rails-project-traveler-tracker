class AttractionSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :hours, :price
end
