class AddRoleToLiveClients < ActiveRecord::Migration
  def change
    add_column :live_clients, :role, :string
  end
end
