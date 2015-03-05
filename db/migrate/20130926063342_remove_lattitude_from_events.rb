class RemoveLattitudeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :lattitude, :float
  end
end
