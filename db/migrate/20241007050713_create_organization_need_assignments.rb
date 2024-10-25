class CreateOrganizationNeedAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :organization_need_assignments do |t|
      t.references :organization, null: false, foreign_key: { on_delete: :cascade }
      t.references :need, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true      

      t.timestamps
    end
  end
end
