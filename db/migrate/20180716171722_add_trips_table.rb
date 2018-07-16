class AddTripsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.belongs_to :traveler
      t.belongs_to :attraction
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
