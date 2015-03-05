class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :owner_user_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
