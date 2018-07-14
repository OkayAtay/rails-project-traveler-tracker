class CreateTravelers < ActiveRecord::Migration[5.2]
  def change
    create_table :travelers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :budget
      t.string :nationality
      t.string :interests
      t.string :password_digest
      t.timestamps
    end
  end
end
