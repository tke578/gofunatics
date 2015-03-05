class RenameOwnerUserIdInEvents < ActiveRecord::Migration
  def change
  	rename_column :events, :owner_user_id, :user_id
  end
end
