class AddStatusAndEventTypeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :status, :integer, :default => 1
    add_column :events, :event_type, :integer, :default => 1
  end
end
