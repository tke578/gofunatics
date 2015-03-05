class AddInviteAllToEvents < ActiveRecord::Migration
  def change
    add_column :events, :invite_all, :boolean
  end
end
