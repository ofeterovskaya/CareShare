class CreateOrganizationNeedAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :organization_need_assignments do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :need, null: false, foreign_key: true
      t.date :start_date

      t.timestamps
    end
  end
end
