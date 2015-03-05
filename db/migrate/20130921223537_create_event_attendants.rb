class CreateEventAttendants < ActiveRecord::Migration
  def change
    create_table :event_attendants do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :attendee_status

      t.timestamps
    end
  end
end
