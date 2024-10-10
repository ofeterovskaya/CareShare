class CreateVolunteerNeedAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :volunteer_need_assignments do |t|
      t.references :volunteer, null: false, foreign_key: true
      t.references :need, null: false, foreign_key: true

      t.timestamps
    end
  end
end
