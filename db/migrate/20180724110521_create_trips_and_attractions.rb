class CreateTripsAndAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :trips_attractions do |t|
      t.belongs_to :trip, index: true
      t.belongs_to :attraction, index: true
    end
  end

  def down
    remove_column :trips, :attraction_id
  end

end
