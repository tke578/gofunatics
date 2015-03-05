class AddOwnerToEventAttendants < ActiveRecord::Migration
  def change
    add_column :event_attendants, :owner, :integer
  end
end
