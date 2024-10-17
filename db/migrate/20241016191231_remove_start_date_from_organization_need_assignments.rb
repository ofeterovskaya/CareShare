class RemoveStartDateFromOrganizationNeedAssignments < ActiveRecord::Migration[7.1]
  def change
    remove_column :organization_need_assignments, :start_date, :date
  end
end
