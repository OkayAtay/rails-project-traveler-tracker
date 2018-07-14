class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :traveler_id
      t.integer :attraction_id
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
