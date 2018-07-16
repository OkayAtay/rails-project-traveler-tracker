class AddAssociationToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :traveler, :belongs_to
    add_column :trips, :attraction, :belongs_to
  end
end
