class AddStatusToOrganizationNeedAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :organization_need_assignments, :status, :string
  end
end
