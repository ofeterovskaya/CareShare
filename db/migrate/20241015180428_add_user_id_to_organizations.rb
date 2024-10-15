class AddUserIdToOrganizations < ActiveRecord::Migration[7.1]
  def change
    add_column :organizations, :user_id, :integer
    add_index :organizations, :user_id
  end
end
