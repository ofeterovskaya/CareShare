class AddUserIdToOrganizationNeedAssignments < ActiveRecord::Migration[7.1]
  def change
    add_reference :organization_need_assignments, :user, null: true, foreign_key: true
  end
end
