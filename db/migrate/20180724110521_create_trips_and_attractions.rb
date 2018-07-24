class CreateTripsAndAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions_trips do |t|
      t.belongs_to :trip, index: true
      t.belongs_to :attraction, index: true
    end
  end


end
