class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :location
      t.string :hours
      t.integer :price
      t.timestamps
    end
  end
end
