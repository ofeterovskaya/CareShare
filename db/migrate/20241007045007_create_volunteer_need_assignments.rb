class CreateVolunteerNeedAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :volunteer_need_assignments do |t|
      t.references :volunteer, null: false, foreign_key: { to_table: :users }
      t.references :need, null: false, foreign_key: { to_table: :volunteer_needs }

      t.timestamps
    end
  end
end